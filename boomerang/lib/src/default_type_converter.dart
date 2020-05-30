import 'dart:collection';
import 'dart:convert';

import 'type_converter.dart';

class DefaultTypeConverter extends TypeConverter {

  const DefaultTypeConverter();

  //TODO add a nice error message in case type conversion fails
  @override
  T fromJson<T>(Map<String, dynamic > jsonMap) => jsonMap as T;

  @override
  List<T> listFromJson<T>(List<Map<String, dynamic >> jsonList) => jsonList as List<T>;

  //TODO add a nice error message in case type conversion fails
  @override
  Map<String, dynamic> toJson<T>(T body) => body as Map<String, dynamic>;



//  @override
//  Map<String, dynamic> fromJsonMap<String, dynamic>(String jsonStr) {
//    return jsonDecode(jsonStr);
//  }
//
//  @override
//  String toJson<T extends Map<String, dynamic>>(T body) {
//    return jsonEncode(body);
//  }

}