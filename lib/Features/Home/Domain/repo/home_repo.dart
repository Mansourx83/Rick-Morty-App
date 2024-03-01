import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/Entities/character_entity.dart';

import '../../../../Core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CharacterEntity>>> fetchCharacters(
      {required int pageNumber});
}
