// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacterEntityAdapter extends TypeAdapter<CharacterEntity> {
  @override
  final int typeId = 0;

  @override
  CharacterEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CharacterEntity(
      characterImage: fields[0] as String?,
      characterName: fields[1] as String?,
      characterStatus: fields[2] as String?,
      characterSpecies: fields[3] as String?,
      characterType: fields[4] as String?,
      characterGender: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CharacterEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.characterImage)
      ..writeByte(1)
      ..write(obj.characterName)
      ..writeByte(2)
      ..write(obj.characterStatus)
      ..writeByte(3)
      ..write(obj.characterSpecies)
      ..writeByte(4)
      ..write(obj.characterType)
      ..writeByte(5)
      ..write(obj.characterGender);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
