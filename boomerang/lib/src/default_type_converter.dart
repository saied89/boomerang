import 'dart:collection';
import 'dart:convert';

import 'type_converter.dart';

class DefaultTypeConverter extends TypeConverter {

  const DefaultTypeConverter();

  @override
  T fromJson<T>(String jsonStr) {
    return jsonDecode(jsonStr);
  }

  @override
  String toJson<T>(T body) {
    return jsonEncode(body);
  }

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