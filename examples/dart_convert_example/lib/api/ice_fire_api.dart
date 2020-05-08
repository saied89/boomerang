import 'package:boomerang/boomerang.dart';
import 'package:http/http.dart' as http;

final boomerang = Boomerang(
    client: http.Client(), baseUrl: 'https://anapioficeandfire.com/api/');

Call<Map<String, dynamic>> getSnow = Call(Get('characters/583'));

extension Equeue<T> on Call<T> {
  Future<Response<T>> enqueue() => boomerang.dispatch(this);
}
