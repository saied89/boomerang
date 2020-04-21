import 'package:meta/meta.dart';

@sealed
abstract class Method {
  final String url;

  const Method([this.url]);

  String get methodString;
}

class Get extends Method {
  const Get([String url]) : super(url);

  @override
  String get methodString => 'GET';
}

class Post extends Method {
  @override
  String get methodString => 'POST';
}
