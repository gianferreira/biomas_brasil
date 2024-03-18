import 'package:biomas_brasil/core/arch/failures.dart';
import 'package:biomas_brasil/core/firebase/auth_api.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataSource {
  Future<UserCredential> signUp({
    required String email,
    required String password,
  });
}

class AuthDataSourceImpl implements AuthDataSource {
  final AuthAPI api;

  AuthDataSourceImpl({
    required this.api,
  });

  @override
  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.signUp(
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
