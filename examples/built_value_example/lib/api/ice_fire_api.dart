import 'package:boomerang/boomerang.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value_example/models/Character.dart';

Call<Character> getSnow = Call(Get('characters/583'));

Call<BuiltList<Character>> getCharacters = Call(Get('characters'));
