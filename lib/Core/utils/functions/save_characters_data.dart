import 'package:hive_flutter/hive_flutter.dart';

import '../../../Features/Home/Domain/Entities/character_entity.dart';
import '../constants.dart';

void saveCharactersData(List<CharacterEntity> characters) {
  Box<CharacterEntity> characterBox = Hive.box<CharacterEntity>(kCharactersBox);
  characterBox.addAll(characters);
}
