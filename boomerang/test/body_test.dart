import 'package:boomerang/src/body.dart';
import 'package:test/test.dart';

class TestBody {}

main() {
  test('body type is saved in type cast', () {
    Body body = Body(TestBody());
    expect(body.body.runtimeType, equals(TestBody));
  });

  test('runTime Type retainment', () {
    Object body = TestBody();
    expect(body.runtimeType, equals(TestBody));
  });
}