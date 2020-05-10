import 'package:boomerang/boomerang.dart';
import 'package:boomerang/src/method.dart';
import 'package:test/test.dart';

class TestBody {}

class TestConverter implements TypeConverter {
  @override
  T fromJson<T>(String jsonStr) {
    throw UnimplementedError();
  }

  @override
  String toJson<T>(T json) => 'Test Json';
}

main() {
  test('query params are handled', () {
    final subject = Call(Get('char'), queryParams: {'char': 'snow'});
    final req = subject.getRequest('baseUrl/', DefaultTypeConverter());

    expect(req.url.toString(), equals('baseUrl/char?char=snow'));
  });

  test('converter is called when body is set', () {
    final subject = Call(Get('char'), body: TestBody());
    expect(subject.getRequest('baseUrl', TestConverter()).body,
        equals('Test Json'));
  });

  test('form-url-encoded dic is set correctly in request', () {
    final subject = Call(Get('char'), bodyFields: {'test': 'test field'});
    expect(subject.body, isNull);
    expect(subject.bodyFields, equals({'test': 'test field'}));
  });

  test('headers are added correctly', () {
    final subject = Call(Get('char'), headers: {'test': 'test field'});
    expect(subject.headers, equals({'test': 'test field'}));
  });
}
