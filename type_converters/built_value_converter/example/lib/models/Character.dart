library character;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:example/serializer/serializers.dart';

part 'Character.g.dart';

abstract class Character implements Built<Character, CharacterBuilder> {
  Character._();

  factory Character([updates(CharacterBuilder b)]) = _$Character;

  @BuiltValueField(wireName: 'url')
  String get url;
  @BuiltValueField(wireName: 'name')
  String get name;
  @BuiltValueField(wireName: 'gender')
  String get gender;
  @BuiltValueField(wireName: 'culture')
  String get culture;
  @BuiltValueField(wireName: 'born')
  String get born;
  @BuiltValueField(wireName: 'died')
  String get died;
  @BuiltValueField(wireName: 'titles')
  BuiltList<String> get titles;
  @BuiltValueField(wireName: 'aliases')
  BuiltList<String> get aliases;
  @BuiltValueField(wireName: 'father')
  String get father;
  @BuiltValueField(wireName: 'mother')
  String get mother;
  @BuiltValueField(wireName: 'spouse')
  String get spouse;
  @BuiltValueField(wireName: 'allegiances')
  BuiltList<String> get allegiances;
  @BuiltValueField(wireName: 'books')
  BuiltList<String> get books;
  @BuiltValueField(wireName: 'povBooks')
  BuiltList<String> get povBooks;
  @BuiltValueField(wireName: 'tvSeries')
  BuiltList<String> get tvSeries;
  @BuiltValueField(wireName: 'playedBy')
  BuiltList<String> get playedBy;
  String toJson() {
    return json.encode(serializers.serializeWith(Character.serializer, this));
  }

  static Character fromJson(String jsonString) {
    return serializers.deserializeWith(
        Character.serializer, json.decode(jsonString));
  }

  static Serializer<Character> get serializer => _$characterSerializer;
}