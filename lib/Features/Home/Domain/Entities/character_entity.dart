import 'package:hive_flutter/adapters.dart';

part 'character_entity.g.dart';

@HiveType(typeId: 0)
class CharacterEntity {
  @HiveField(0)
  final String? characterImage;
  @HiveField(1)
  final String? characterName;
  @HiveField(2)
  final String? characterStatus;
  @HiveField(3)
  final String? characterSpecies;
  @HiveField(4)
  final String? characterType;
  @HiveField(5)
  final String? characterGender;

  const CharacterEntity({
    required this.characterImage,
    required this.characterName,
    required this.characterStatus,
    required this.characterSpecies,
    required this.characterType,
    required this.characterGender,
  });
}
