import 'dart:convert';

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
    return Response(res, _convertBody(decodedRes, converter));
  }

  T _convertBody<T>(dynamic decodedRes, TypeConverter converter) {
    if (decodedRes == null) {
      return null;
    } else {
      return converter.fromJson<T>(decodedRes);
    }
  }
}
