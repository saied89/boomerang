import 'dart:convert';

import 'package:boomerang/boomerang.dart';
import 'package:boomerang/src/base_call.dart';
import 'package:http/http.dart' as http;

class ListCall<T> extends BaseCall<List<T>> {
  ListCall(Method method,
      {Map<String, String> bodyFields,
      Map<String, String> pathParams,
      Map<String, String> queryParams,
      Map<String, String> headers,
      String url,
      Object body})
      : super(method,
            bodyFields: bodyFields,
            pathParams: pathParams,
            queryParams: queryParams,
            headers: headers,
            url: url,
            body: body);

  @override
  List<T> makeRes(http.Response response, TypeConverter converter) {
    final decodedRes = jsonDecode(response.body);
    assert(decodedRes is Iterable);
    final t = decodedRes.map((e) {
      return converter.fromJson<T>(e);
    });
    return List.from(t);
  }
}
