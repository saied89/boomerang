import 'dart:convert';
import 'package:example/models/character.dart';
import 'package:serializable_converter/serializable_converter.dart';
import 'package:test/test.dart';


main() {
  test('Models is deserialized correctly', () {
    final jsonStr = """
    {"url":"https://anapioficeandfire.com/api/characters/583","name":"Jon Snow","gender":"Male","culture":"Northmen","born":"In 283 AC","died":"","titles":["Lord Commander of the Night's Watch"],"aliases":["Lord Snow","Ned Stark's Bastard","The Snow of Winterfell","The Crow-Come-Over","The 998th Lord Commander of the Night's Watch","The Bastard of Winterfell","The Black Bastard of the Wall","Lord Crow"],"father":"","mother":"","spouse":"","allegiances":["https://anapioficeandfire.com/api/houses/362"],"books":["https://anapioficeandfire.com/api/books/5"],"povBooks":["https://anapioficeandfire.com/api/books/1","https://anapioficeandfire.com/api/books/2","https://anapioficeandfire.com/api/books/3","https://anapioficeandfire.com/api/books/8"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":["Kit Harington"]}
    """;

    final jsonMap = jsonDecode(jsonStr);
    var character = Character.fromJson(jsonMap);
    expect(character.gender, equals('Male'));
    prints(character.aliases);
    expect(character.aliases[0], equals('Lord Snow'));
    expect(character.aliases[2], equals('The Snow of Winterfell'));
  });

  test("json is deserialized and serialized correctly", () {
    final serializers = Serializers([Character.serializer]);
    final subject = SerializableConverter(serializers);

    final jsonStr = """{"name":"Jon Snow","gender":"Male","aliases":["Lord Snow","Ned Stark's Bastard","The Snow of Winterfell","The Crow-Come-Over","The 998th Lord Commander of the Night's Watch","The Bastard of Winterfell","The Black Bastard of the Wall","Lord Crow"]}""";

    final modeled = subject.fromJson<Character>(jsonStr);

    final serializedJson = subject.toJson(modeled);

    expect(jsonStr, equals(serializedJson));

  });
}