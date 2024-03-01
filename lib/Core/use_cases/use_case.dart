import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_application/Core/errors/failures.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param param);
}
