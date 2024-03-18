import 'package:biomas_brasil/core/arch/failures.dart';
import 'package:biomas_brasil/core/firebase/auth_api.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInDataSource {
  Future<UserCredential> signIn({
    required String email,
    required String password,
  });
}

class SignInDataSourceImpl implements SignInDataSource {
  final AuthAPI api;

  SignInDataSourceImpl({
    required this.api,
  });

  @override
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.signIn(
        email: email, 
        password: password,
      );
      
      return response;
    } catch (err) {
      throw ServerFailure(
        err.hashCode,
      );
    }
  }
}
