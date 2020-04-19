import 'package:boomerang/boomerang.dart';
import 'package:http/http.dart' as http;

abstract class Body<T> {
  final T body;

  Body(this.body);

  String getSerialized(TypeConverter typeConverter);
}