import 'package:boomerang/boomerang.dart';
import 'package:built_value_converter/built_value_converter.dart';
import 'package:built_value_example/serializers/serializers.dart';
import 'package:http/http.dart' as http;

final converter = BuiltValueConverter(serializers);

final boomerang = Boomerang(
    converter: converter, client: http.Client(), baseUrl: 'https://anapioficeandfire.com/api/');

// Add custom error handling here
extension Equeue<T> on BaseCall<T> {
  Future<Response<T>> enqueue() => boomerang.dispatch(this);
} // sample usage: var response = await getSnow.enqueue();