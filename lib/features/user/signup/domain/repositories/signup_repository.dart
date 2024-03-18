import 'package:biomas_brasil/core/arch/failures.dart';
import 'package:biomas_brasil/features/user/signup/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpRepository {
  Future<Either<Failure, UserCredential>> signUp({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> createUser({
    required String id,
    required String name,
    required String email,
  });

  Future<Either<Failure, UserEntity>> getUserById({
    required String id,
  });
}
