import 'dart:html';

import 'package:boomerang/src/response.dart';
import 'package:boomerang/src/type_converter.dart';
import 'package:http/http.dart';

class Boomerang {
  final Client client;
  final TypeConverter converter;

  Boomerang(this.converter, this.client);

}
