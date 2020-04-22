import 'package:boomerang/boomerang.dart';

import 'method.dart';
import 'body.dart';
import 'package:http/http.dart' as http;

class Call<T> {
  final Method method;
  final String url;
  final Body body;
  const Call(this.method, {this.url, this.body});

  http.Request getRequest(String baseUrl, TypeConverter converter) {
    final req = http.Request(method.methodString, _getUrl(method, url, baseUrl));
    if(body != null) {
      req.body = body.getSerialized(converter);
    }
    return req;
  }

  static Uri _getUrl(Method method, String url, baseUrl) {
    if (method.url != null) {
      return Uri.parse(baseUrl + method.url);
    } else if (url != null) {
      return Uri.parse(url);
    } else {
      throw StateError('Url should be either set in method or in its argument');
    }
  }
}