import 'dart:html';

import 'package:boomerang/src/call.dart';
import 'package:boomerang/src/response.dart';
import 'package:boomerang/src/type_converter.dart';
import 'package:http/http.dart' as http;

class Boomerang {
  final http.Client client;
  final TypeConverter converter;
  final String baseUrl;

  Future<Response<T>> dispatch<T>(Call<T> call) async {
    var streamedResponse = await client.send(call.getRequest(baseUrl, converter));
    final res = await http.Response.fromStream(streamedResponse);
    final body  = converter.fromJson<T>(res.body);
    return Response(res, body);
  }

  //TODO assert [baseUrl] last char is '/'
  Boomerang(this.converter, this.client, this.baseUrl);
}
