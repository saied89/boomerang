import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uri/uri.dart';

import '../boomerang.dart';
import 'method.dart';

/// A boomerang call. Holds parameters and constructs a [http.Request] accordingly.
/// [headers] are added to [http.Request].
abstract class BaseCall<T> {
  final Method method;
  final String url;
  final Object body;
  final Map<String, String> pathParams;
  final Map<String, String> queryParams;
  final Map<String, String> headers;
  final Map<String, String> bodyFields;

  BaseCall(this.method,
      {this.url, this.body, this.pathParams, this.queryParams, this.headers, this.bodyFields});

  T makeRes(http.Response response, TypeConverter typeConverter);

  http.Request getRequest(String baseUrl, TypeConverter converter) {
    final req =
        http.Request(method.methodString, _getUrl(method, url, baseUrl, pathParams, queryParams));
    // handle body
    if (body != null) {
      req.body = jsonEncode(converter.toJson(body));
    }
    if (bodyFields != null) {
      req.bodyFields = bodyFields;
    }

    // handle headers
    if (headers != null) {
      req.headers.addAll(headers);
    }

    return req;
  }

  Uri _getUrl(Method method, String url, baseUrl, Map<String, String> pathParams, queryParams) {
    var uri = _getBaseUrl(method, url, baseUrl);
    if (pathParams != null) {
      uri = _addPathParams(uri, pathParams);
    }
    final builder = UriBuilder.fromUri(Uri.parse(uri));
    if (queryParams != null) {
      builder.queryParameters = queryParams;
    }
    return builder.build();
  }

  /// If path in [method] is not set, baseUrl from [Boomerang] is ignored and
  /// the string [url] is used.
  String _getBaseUrl(Method method, String url, baseUrl) {
    if (method.relUrl != null) {
      return baseUrl + method.relUrl;
    } else if (url != null) {
      return url;
    } else {
      throw StateError('Url should be either set in method or in url');
    }
  }

  String _addPathParams(String rawPath, Map<String, String> pathParams) {
    if (pathParams != null) {
      pathParams.forEach((key, value) {
        if (rawPath.contains('{$key}')) {
          rawPath = rawPath.replaceFirst('{$key}', value);
        } else {
          throw StateError('Path param placeholder for key: $key, not found in Url: $rawPath.');
        }
      });
    }
    return rawPath;
  }
}
