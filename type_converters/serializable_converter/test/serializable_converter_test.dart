import 'package:serializable_converter/serializable_converter.dart';
import 'package:test/test.dart';

class TestBody {
  // Empty test body class with stub serializer
  static Serializer<TestBody> serializer =
  Serializer((map) => TestBody(), (t) => {'value': 'test'});
}

void main() {

  test('serializers works with object and runtime type', () {
    final serializers = Serializers([TestBody.serializer]);
    final subject = SerializableConverter(serializers);
    Object testBody = TestBody();
    expect(subject.objectToJson(testBody), equals("""{"value":"test"}"""));
  });
}
