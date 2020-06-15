import 'dart:convert';

import 'package:boomerang/boomerang.dart';
import 'package:boomerang/src/base_call.dart';
import 'package:http/http.dart' as http;

class Call<T> extends BaseCall<T> {
  Call(
    Method method, {
    String url,
    Object body,
    Map<String, String> pathParams,
    Map<String, String> queryParams,
    Map<String, String> headers,
    Map<String, String> bodyFields,
  }) : super(
          method,
          url: url,
          body: body,
          pathParams: pathParams,
          queryParams: queryParams,
          headers: headers,
          bodyFields: bodyFields,
        );

  @override
  T makeRes(http.Response response, TypeConverter converter) =>
      converter.fromJson(
          jsonDecode(response.body)
      );
}
