// TODO: Put public facing types in this file.

import 'dart:convert';

import 'package:boomerang/boomerang.dart';
import 'package:serializable_converter/src/serializers.dart';

class SerializableConverter implements TypeConverter {
  final Serializers serializers;

  SerializableConverter(this.serializers);

  @override
  T fromJson<T>(String jsonStr) {
    final serializerForType = serializers.getSerializer<T>();
    final Map<String, dynamic> jsonMap = jsonDecode(jsonStr);
    return serializerForType.fromJson(jsonMap);
  }

  @override
  String toJson<T>(T body) {
    final serializerForType = serializers.getSerializer<T>();
    assert(serializerForType != null);
    return jsonEncode(serializerForType.toJson(body));
  }

  String objectToJson(Object object) {
    final serializerForType = serializers.getSerializerWithType(object.runtimeType);
    assert(serializerForType != null);
    return jsonEncode(serializerForType.toJson(object));
  }

}
