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

    return Response(res, _convertBody(res.body, converter));
  }

  T _convertBody<T>(String jsonStr, TypeConverter converter) {
    if (jsonStr == null || jsonStr.isEmpty) {
      return null;
    } else {
      return converter.fromJson<T>(jsonStr);
    }
  }
}
