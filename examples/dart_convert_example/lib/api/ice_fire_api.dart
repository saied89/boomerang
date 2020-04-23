import 'package:boomerang/boomerang.dart';
import 'package:http/http.dart' as http;

final boomerang =
  Boomerang(DefaultTypeConverter(), http.Client(), '');

Call<Map<String, dynamic>> getSnow =
Call(Get(), url: 'https://anapioficeandfire.com/api/characters/583');

extension Equeue<T> on Call<T> {
  Future<Response<T>> enqueue() => boomerang.dispatch(this);
}