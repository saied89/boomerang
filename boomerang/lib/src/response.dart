import 'package:http/http.dart' as http;

class Response<T> extends http.BaseResponse {
  final T body;

  Response(http.BaseResponse httpResponse, this.body)
      : super(httpResponse.statusCode,
            contentLength: httpResponse.contentLength,
            request: httpResponse.request,
            headers: httpResponse.headers,
            isRedirect: httpResponse.isRedirect,
            persistentConnection: httpResponse.persistentConnection,
            reasonPhrase: httpResponse.reasonPhrase);
}
