import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/Entities/character_entity.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/use_cases/fetch_characters_use_case.dart';

part 'character_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.fetchCharactersUseCase) : super(CharactersInitial());

  final FetchCharactersUseCase fetchCharactersUseCase;

  List<CharacterEntity> characters = [];
  List<CharacterEntity> searchedCharacters = [];

  Future<void> searchCharacter(String query) async {
    emit(CharactersSearching());
    searchedCharacters = characters
        .where((element) => element.characterName!
            .toLowerCase()
            .startsWith(query.toLowerCase()))
        .toList();
    emit(CharactersSuccess());
  }

  Future<void> fetchCharacters({required int pageNumber}) async {
    if (pageNumber == 1) {
      emit(CharactersLoading());
    } else {
      emit(CharactersPaginationLoading());
    }

    var result = await fetchCharactersUseCase.call(pageNumber);

    result.fold(
      (failure) {
        if (pageNumber == 1) {
          emit(CharactersFailure(errMessage: failure.errMessage));
        } else {
          emit(CharactersPaginationFailure(errMessage: failure.errMessage));
        }
      },
      (characters) {
        this.characters.addAll(characters);
        searchedCharacters = characters;
        emit(CharactersSuccess());
      },
    );
  }
}
