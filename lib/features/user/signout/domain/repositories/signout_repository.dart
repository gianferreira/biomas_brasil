import 'package:biomas_brasil/core/arch/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SignoutRepository {
  Future<Either<Failure, void>> logout();
}
