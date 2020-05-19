// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) {
  return Character(
    name: json['name'] as String,
    gender: json['gender'] as String,
    aliases: (json['aliases'] as List).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'aliases': instance.aliases,
    };
