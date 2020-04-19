import 'dart:html';

import 'package:boomerang/boomerang.dart';
import 'package:boomerang/src/request.dart';

import 'method.dart';
import 'body.dart';
import 'package:http/http.dart' as http;

abstract class Call<T> {
  final Method method;
  final String url;
  final Body body;
  Call(this.method, {this.url, this.body});

  http.Request getRequest(String baseUrl, TypeConverter converter) {
    final req = http.Request(method.methodString, _getUrl(method, url, baseUrl));
    req.body = body.getSerialized(converter);
    return req;
  }

  static Uri _getUrl(Method method, String url, baseUrl) {
    if (method.url != null && method.url.isNotEmpty) {
      return Uri.parse(baseUrl + method.url);
    } else if (url != null) {
      return Uri.parse(url);
    } else {
      throw StateError('Url should be either set in method or in its argument');
    }
  }
}