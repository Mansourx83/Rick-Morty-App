import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_application/Core/utils/constants.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/Entities/character_entity.dart';

abstract class HomeLocalDataSource {
  List<CharacterEntity> fetchCharacters({required int pageNumber});
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<CharacterEntity> fetchCharacters({required int pageNumber}) {
    var charactersBox = Hive.box<CharacterEntity>(kCharactersBox);

    if (pageNumber * 20 > charactersBox.length) {
      return [];
    }

    int start = (pageNumber - 1) * 20;
    int end = pageNumber * 20;

    return charactersBox.values.toList().sublist(start, end);
  }
}
