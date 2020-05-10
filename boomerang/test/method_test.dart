import 'package:boomerang/boomerang.dart';
import 'package:test/test.dart';

main() {
  test('instantiation with leading / fails', () {
    expect(() => Get('/whatever'), throwsA(TypeMatcher<AssertionError>()));
  });

  test('method with empty path can be instantiated', () {
    expect(() => Get(), returnsNormally);
  });

  test('Get has correct method String', () {
    expect(Get().methodString, equals('GET'));
  });

  test('Post has correct method String', () {
    expect(Post().methodString, equals('POST'));
  });

  test('Delete has correct method String', () {
    expect(Delete().methodString, equals('DELETE'));
  });

  test('Put has correct method String', () {
    expect(Put().methodString, equals('PUT'));
  });

  test('Head has correct method String', () {
    expect(Head().methodString, equals('HEAD'));
  });
}
