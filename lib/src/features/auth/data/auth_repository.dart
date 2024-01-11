import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/domain.dart';
import 'package:geats/src/services/services.dart';

class AuthRepository {
  final userDb = FirebaseFirestore.instance.collection('user').withConverter(
        fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
        toFirestore: (User user, _) => user.toJson(),
      );
  Future<Result> login(RequestLogin requestLogin) async {
    try {
      final emailAddress = requestLogin.email;
      final password = requestLogin.password;
      final credential = await auth.FirebaseAuth.instance
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

      final credential = await auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);

      await auth.FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      final credUser = credential.user;
      final user = User(
        id: credUser!.uid,
        name: requestRegister.name,
        email: requestRegister.email,
        profileUrl: '',
      );

      await userDb.doc(user.id).set(user);

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
