import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/domain.dart';
import 'package:geats/src/services/services.dart';

class AuthRepository {
  Future<Result> login(RequestLogin requestLogin) async {
    try {
      final emailAddress = requestLogin.email;
      final password = requestLogin.password;
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      final user = credential.user;
      if (user == null) {
        return Result.failure(
            NetworkExceptions.getFirebaseException('User not found'),
            StackTrace.current);
      }

      return const Result.success(true);
    } catch (e, stackTrace) {
      return Result.failure(
          NetworkExceptions.getFirebaseException(e), stackTrace);
    }
  }

  Future<Result> register(RequestRegister requestRegister) async {
    try {
      final emailAddress = requestRegister.email;
      final password = requestRegister.password;
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);
      final user = credential.user;
      if (user == null) {
        return Result.failure(
            NetworkExceptions.getFirebaseException('User not found'),
            StackTrace.current);
      }

      return const Result.success(true);
    } catch (e, stackTrace) {
      return Result.failure(
          NetworkExceptions.getFirebaseException(e), stackTrace);
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
