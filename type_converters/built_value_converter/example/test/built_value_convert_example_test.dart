import 'dart:convert';

import 'package:built_value_converter/built_value_converter.dart';
import 'package:example/models/Character.dart';
import 'package:example/serializer/serializers.dart';
import 'package:test/test.dart';

void main() {
  test("json string is deserialized correctly", () {
    final subject = BuiltValueConverter(serializers);

    final jsonStr = """
    {"url":"https://anapioficeandfire.com/api/characters/583","name":"Jon Snow","gender":"Male","culture":"Northmen","born":"In 283 AC","died":"","titles":["Lord Commander of the Night's Watch"],"aliases":["Lord Snow","Ned Stark's Bastard","The Snow of Winterfell","The Crow-Come-Over","The 998th Lord Commander of the Night's Watch","The Bastard of Winterfell","The Black Bastard of the Wall","Lord Crow"],"father":"","mother":"","spouse":"","allegiances":["https://anapioficeandfire.com/api/houses/362"],"books":["https://anapioficeandfire.com/api/books/5"],"povBooks":["https://anapioficeandfire.com/api/books/1","https://anapioficeandfire.com/api/books/2","https://anapioficeandfire.com/api/books/3","https://anapioficeandfire.com/api/books/8"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":["Kit Harington"]}
    """;

    final modeled = subject.fromJson<Character>(jsonDecode(jsonStr));

    expect(modeled.name, equals("Jon Snow"));
    expect(modeled.aliases[1], equals("Ned Stark's Bastard"));
    expect(modeled.mother, isEmpty);
  });

  test("json is deserialized and serialized correctly", () {
    final subject = BuiltValueConverter(serializers);

    final jsonStr =
        """{"url":"https://anapioficeandfire.com/api/characters/583","name":"Jon Snow","gender":"Male","culture":"Northmen","born":"In 283 AC","died":"","titles":["Lord Commander of the Night's Watch"],"aliases":["Lord Snow","Ned Stark's Bastard","The Snow of Winterfell","The Crow-Come-Over","The 998th Lord Commander of the Night's Watch","The Bastard of Winterfell","The Black Bastard of the Wall","Lord Crow"],"father":"","mother":"","spouse":"","allegiances":["https://anapioficeandfire.com/api/houses/362"],"books":["https://anapioficeandfire.com/api/books/5"],"povBooks":["https://anapioficeandfire.com/api/books/1","https://anapioficeandfire.com/api/books/2","https://anapioficeandfire.com/api/books/3","https://anapioficeandfire.com/api/books/8"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":["Kit Harington"]}""";

    final modeled = subject.fromJson<Character>(jsonDecode(jsonStr));

    final serializedJson = subject.toJson(modeled);

    expect(jsonStr, equals(serializedJson));
  });
}
