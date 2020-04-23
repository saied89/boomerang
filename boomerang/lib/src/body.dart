import 'package:boomerang/boomerang.dart';
import 'package:http/http.dart' as http;

abstract class Body<T> {
  final T body;

  Body(this.body);

  TypeConverter get _converter;

  String get serialized => _converter.toJson(body);
}

class DefaultBody extends Body {
  DefaultBody(body) : super(body);

  @override
  TypeConverter get _converter => null;

}