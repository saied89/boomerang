import 'dart:convert';

import 'package:boomerang/boomerang.dart';
import 'package:boomerang/src/list_call.dart';
import 'package:test/test.dart';

class MockConverter extends TypeConverter {
  @override
  T fromJson<T>(Map<String, dynamic> jsonMap) {
    assert(T == MockData);
    return MockData(jsonMap['field1'], jsonMap['field2']) as T;
  }

  @override
  Map<String, dynamic> toJson<T>(T json) {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}

class MockData {
 final String field1;
 final String field2;

  MockData(this.field1, this.field2);
}

main() {
 test('l', () {
  final ls = ListCall<MockData>(Get(''));
  String json = """
  [
  {
  "field1": "data1",
  "field2": "data2"
  },
    {
  "field1": "data1",
  "field2": "data2"
  }
  ]
  """;

  final jMap = jsonDecode(json);
  assert(jMap is Iterable);
  expect((jMap as Iterable).length, equals(2));
  final t = ls.makeRes(jMap, MockConverter());
  expect(t.length, equals(2));
  expect(t[0].field1, equals("data1"));
 });
}