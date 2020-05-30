// TODO: Put public facing types in this file.

import 'dart:convert';

import 'package:boomerang/boomerang.dart';
import 'package:serializable_converter/src/serializers.dart';

class SerializableConverter implements TypeConverter {
  final Serializers serializers;

  SerializableConverter(this.serializers);

  @override
  T fromJson<T>(Map<String, dynamic> jsonMap) {
    final serializerForType = serializers.getSerializer<T>();
    return serializerForType.fromJson(jsonMap);
  }

  @override
  Map<String, dynamic> toJson<T>(T body) {
    final serializerForType = serializers.getSerializer<T>();
    assert(serializerForType != null);
    return serializerForType.toJson(body);
  }

  String objectToJson(Object object) {
    final serializerForType = serializers.getSerializerWithType(object.runtimeType);
    assert(serializerForType != null);
    return jsonEncode(serializerForType.toJson(object));
  }

  @override
  List<T> listFromJson<T>(List<Map<String, dynamic>> jsonList) {
    final serializerForType = serializers.getSerializer<T>();
    assert(serializerForType != null);
    return List.from(jsonList.map((e) => serializerForType.fromJson(e)));
  }

}
