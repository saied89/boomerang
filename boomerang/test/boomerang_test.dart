import 'package:boomerang/boomerang.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

main() {
  test('base url ending assert is asserted', () {
    expect(() => Boomerang(client: http.Client(), baseUrl: 'baseUrlNoEndSlash'), throwsA(TypeMatcher<AssertionError>()));
  });

  test('instance is created successfully with correct end slash', () {
    expect(() => Boomerang(client: http.Client(), baseUrl: 'baseUrlWithEndSlash/'), returnsNormally);
  });
}
