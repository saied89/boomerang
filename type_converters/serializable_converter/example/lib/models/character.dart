import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable(nullable: false)
class Character {
  final String name;
  final String gender;
  final List<String> aliases;
  Character({this.name, this.gender, this.aliases});

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);
}