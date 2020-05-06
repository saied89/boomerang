// TODO: Put public facing types in this file.

import 'dart:convert';

import 'package:boomerang/boomerang.dart';
import 'package:built_value/serializer.dart';

class BuiltValueConverter implements TypeConverter {
  final Serializers serializers;

  BuiltValueConverter(this.serializers);

  @override
  String toJson<T>(T body) {
    final serializerForType = serializers.serializerForType(T);
    assert(serializerForType != null);
    return jsonEncode(serializers.serializeWith(serializerForType, body));
  }

  @override
  T fromJson<T>(String jsonStr) {
    final serializerForType = serializers.serializerForType(T);
    assert(serializerForType != null);

    return serializers.deserializeWith(
        serializerForType, jsonDecode(jsonStr));
  }
}
