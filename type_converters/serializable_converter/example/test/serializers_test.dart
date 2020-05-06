import 'package:example/models/character.dart';
import 'package:serializable_converter/src/serializers.dart';
import 'package:test/test.dart';

main() {
  test('description', () {
    final serializers = Serializers([Character.serializer]);

    expect(serializers.getSerializer<Character>(), isNotNull);
    expect(serializers.getSerializer<String>(), isNull);
  });
}
