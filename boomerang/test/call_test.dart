import 'package:boomerang/boomerang.dart';
import 'package:boomerang/src/method.dart';
import 'package:test/test.dart';

class TestBody {

}

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

  test('description', () {
    final subject = Call(Get('char'), body: TestBody());
    expect(subject.getRequest('baseUrl', TestConverter()).body, equals('Test Json'));
  });
}
