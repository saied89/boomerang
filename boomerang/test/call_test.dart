import 'package:boomerang/boomerang.dart';
import 'package:boomerang/src/method.dart';
import 'package:test/test.dart';

main() {

  test('description', () {
    final subject = Call(Get('char'), queryParams: {'char': 'snow'});
    final req = subject.getRequest('baseUrl/', DefaultTypeConverter());

    expect(req.url.toString(), equals('baseUrl/char?char=snow'));
  });

}
