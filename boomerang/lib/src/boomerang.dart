import 'package:boomerang/src/base_call.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../boomerang.dart';
import 'response.dart';
import 'type_converter.dart';

const defaultConverter = DefaultTypeConverter();

class Boomerang {
  final http.Client client;
  final TypeConverter converter;
  final String baseUrl;

  Boomerang({this.converter = defaultConverter, @required this.client, @required this.baseUrl})
      : assert(baseUrl.endsWith('/'), 'Base Url should end with /:' + baseUrl);

  Future<Response<T>> dispatch<T>(BaseCall<T> call) async {
    var streamedResponse = await client.send(call.getRequest(baseUrl, converter));
    final res = await http.Response.fromStream(streamedResponse);
    return Response(res, call.makeRes(res, converter));
  }
}
