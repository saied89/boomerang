import 'dart:convert';

import 'package:boomerang/src/type_converter.dart';

class DefaultTypeConverter extends TypeConverter<Map<String, dynamic>> {
  @override
  T fromJson<T extends Map<String, dynamic>>(String jsonStr) {
    return jsonDecode(jsonStr);
  }

  @override
  String toJson<T extends Map<String, dynamic>>(T body) {
    return jsonEncode(body);
  }

}