import 'package:boomerang/boomerang.dart';
import 'package:http/http.dart' as http;
import 'package:json_serializable_example/serializers/serializers.dart';
import 'package:serializable_converter/serializable_converter.dart';

final converter = SerializableConverter(serializers);

final boomerang = Boomerang(
    converter: converter, client: http.Client(), baseUrl: 'https://anapioficeandfire.com/api/');

// Add custom error handling here
extension Equeue<T> on Call<T> {
  Future<Response<T>> enqueue() => boomerang.dispatch(this);
} // sample usage: var response = await getSnow.enqueue();
