import 'package:meta/meta.dart';

/// [relUrl] relative url to be appended with a base url. Should not start with */*.
@sealed
abstract class Method {
  final String relUrl;

  Method([this.relUrl])
      : assert(relUrl == null || !relUrl.startsWith('/'),
            'Relative Url should not start with /:' + relUrl);

  String get methodString;
}

class Get extends Method {
  Get([String url]) : super(url);

  @override
  String get methodString => 'GET';
}

class Post extends Method {
  Post([String url]) : super(url);

  @override
  String get methodString => 'POST';
}

class Put extends Method {
  Put([String url]) : super(url);

  @override
  String get methodString => 'PUT';
}

class Delete extends Method {
  Delete([String url]) : super(url);

  @override
  String get methodString => 'DELETE';
}

class Head extends Method {
  Head([String url]) : super(url);

  @override
  String get methodString => 'HEAD';
}
