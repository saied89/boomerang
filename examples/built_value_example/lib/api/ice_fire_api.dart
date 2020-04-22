import 'package:boomerang/boomerang.dart';
import 'package:boomerang/src/method.dart';
import 'package:built_value_converter/built_value_converter.dart';
import 'package:built_value_example/model/Character.dart';
import 'package:built_value_example/serializer/serializers.dart';
import 'package:http/http.dart' as http;

final converter = BuiltValueConverter(serializers);
final boomerang =
    Boomerang(converter, http.Client(), 'https://anapioficeandfire.com/api/');

Call<Character> getSnow =
    Call(Get(), url: 'https://anapioficeandfire.com/api/characters/583');

//Call<Character> getCharacterByNum(int num) => Call(Get(), url: 'https://anapioficeandfire.com/api/characters/583');

extension Equeue<T> on Call<T> {
  Future<Response<T>> enqueue() => boomerang.dispatch(this);
}
