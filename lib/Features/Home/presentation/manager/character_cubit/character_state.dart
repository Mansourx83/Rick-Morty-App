part of 'character_cubit.dart';

sealed class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

final class CharactersInitial extends CharactersState {}

// fetching characters states
final class CharactersLoading extends CharactersState {}

final class CharactersFailure extends CharactersState {
  final String errMessage;

  const CharactersFailure({required this.errMessage});
}

final class CharactersSuccess extends CharactersState {}

// Pagination states
final class CharactersPaginationLoading extends CharactersState {}

final class CharactersPaginationFailure extends CharactersState {
  final String errMessage;

  const CharactersPaginationFailure({required this.errMessage});
}

// searching state
final class CharactersSearching extends CharactersState {}
