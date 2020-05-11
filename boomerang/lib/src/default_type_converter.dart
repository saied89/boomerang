import 'dart:convert';

import 'type_converter.dart';

class DefaultTypeConverter extends TypeConverter<Map<String, dynamic>> {

  const DefaultTypeConverter();

  @override
  T fromJson<T extends Map<String, dynamic>>(String jsonStr) {
    return jsonDecode(jsonStr);
  }

  @override
  String toJson<T extends Map<String, dynamic>>(T body) {
    return jsonEncode(body);
  }

}