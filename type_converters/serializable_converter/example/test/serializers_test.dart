import 'package:example/models/character.dart';
import 'package:serializable_converter/serializable_converter.dart';
import 'package:serializable_converter/src/serializers.dart';
import 'package:test/test.dart';

main() {
  test('serializer is fetched from serializers correctly', () {
    final serializers = Serializers([Character.serializer]);

    expect(serializers.getSerializer<Character>(), isNotNull);
    expect(serializers.getSerializer<String>(), isNull);
  });
}
