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

  Future<Response<T>> dispatch<T>(Call<T> call) async {
    var streamedResponse =
        await client.send(call.getRequest(baseUrl, converter));
    final res = await http.Response.fromStream(streamedResponse);
    final body = converter.fromJson<T>(res.body);
    return Response(res, body);
  }

  Boomerang(
      {this.converter = defaultConverter,
      @required this.client,
      @required this.baseUrl})
      : assert(baseUrl.endsWith('/'), 'Base Url should end with /:' + baseUrl);
}
