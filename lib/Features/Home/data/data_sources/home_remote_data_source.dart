// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:rick_and_morty_application/Features/Home/Domain/Entities/character_entity.dart';

import '../../../../Core/utils/api_service.dart';
import '../../../../Core/utils/functions/save_characters_data.dart';
import '../models/character_model/character_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CharacterEntity>> fetchCharacters({required int pageNumber});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiService apiService;
  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<CharacterEntity>> fetchCharacters(
      {required int pageNumber}) async {
    var data = await apiService.get(endPoint: 'character?page=$pageNumber');
    List<CharacterEntity> characters = parseCharacters(data);
    saveCharactersData(characters);
    return characters;
  }

  List<CharacterEntity> parseCharacters(Map<String, dynamic> data) {
    List<CharacterEntity> characters = [];
    for (var item in data['results']) {
      characters.add(CharacterModel.fromJson(item));
    }
    return characters;
  }
}
