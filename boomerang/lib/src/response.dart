import 'package:http/http.dart' as http;

class Response<T> {
  final T body;
  final http.Response httpResponse;

  Response(this.httpResponse, this.body);
}
