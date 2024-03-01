import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty_application/Core/errors/failures.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/Entities/character_entity.dart';
import 'package:rick_and_morty_application/Features/Home/Domain/repo/home_repo.dart';

import '../data_sources/home_local_data_source.dart';
import '../data_sources/home_remote_data_source.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({
    required this.homeLocalDataSource,
    required this.homeRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<CharacterEntity>>> fetchCharacters(
      {required int pageNumber}) async {
    try {
      List<CharacterEntity> characters = homeLocalDataSource.fetchCharacters(pageNumber: pageNumber);
      if (characters.isEmpty) {
        characters =
            await homeRemoteDataSource.fetchCharacters(pageNumber: pageNumber);
      }

      return right(characters);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
