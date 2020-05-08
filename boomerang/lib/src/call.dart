import 'package:boomerang/boomerang.dart';
import 'package:uri/uri.dart';

import 'method.dart';
import 'body.dart';
import 'package:http/http.dart' as http;

class Call<T> {
  final Method method;
  final String url;
  final Body body;
  final Map<String, String> pathParams;
  final Map<String, String> queryParams;
  final Map<String, String> headers;

  const Call(this.method,
      {this.pathParams, this.queryParams, this.headers, this.url, this.body});

  http.Request getRequest(String baseUrl, TypeConverter converter) {
    final req = http.Request(method.methodString,
        _getUrl(method, url, baseUrl, pathParams, queryParams));
    if (body != null) {
      req.body = body.serialized;
    }
    return req;
  }

  Uri _getUrl(Method method, String url, baseUrl,
      Map<String, String> pathParams, queryParams) {
    final uri = _getBaseUrl(method, url, baseUrl);
    final builder = UriBuilder.fromUri(uri);
    if (queryParams != null) {
      builder.queryParameters = queryParams;
    }
    return builder.build();
  }

  Uri _getBaseUrl(Method method, String url, baseUrl) {
    if (method.url != null) {
      return Uri.parse(baseUrl + method.url);
    } else if (url != null) {
      return Uri.parse(url);
    } else {
      throw StateError('Url should be either set in method or in its argument');
    }
  }
}
