import 'dart:convert';

import 'package:boomerang/src/list_call.dart';

import '../boomerang.dart';
import 'call.dart';
import 'response.dart';
import 'type_converter.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const defaultConverter = DefaultTypeConverter();

class Boomerang {
  final http.Client client;
  final TypeConverter converter;
  final String baseUrl;

  Boomerang(
      {this.converter = defaultConverter,
        @required this.client,
        @required this.baseUrl})
      : assert(baseUrl.endsWith('/'), 'Base Url should end with /:' + baseUrl);

  Future<Response<T>> dispatch<T>(Call<T> call) async {
    var streamedResponse =
        await client.send(call.getRequest(baseUrl, converter));
    final res = await http.Response.fromStream(streamedResponse);
    final decodedRes = jsonDecode(res.body);
    return Response(res, _convertBody(call, decodedRes, converter));
  }

  T _convertBody<T>(Call<T> call, dynamic decodedRes, TypeConverter converter) {
    if (decodedRes == null) {
      return null;
    } else {
      if(call is ListCall) {
        assert(decodedRes is Iterable);
        final ls = call as ListCall;
        return ls.makeRes(decodedRes, converter) as T;
      }
      else {
        return converter.fromJson<T>(decodedRes);
      }
    }
  }
}
