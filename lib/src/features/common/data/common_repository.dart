import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/auth/domain/request_user.dart';
import 'package:geats/src/features/auth/domain/user.dart';
import 'package:geats/src/services/services.dart';

class CommonRepository {
  final userDb = FirebaseFirestore.instance.collection('user').withConverter(
        fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
        toFirestore: (User user, _) => user.toJson(),
      );

  final requestUserDb = FirebaseFirestore.instance
      .collection('user')
      .withConverter(
        fromFirestore: (snapshot, _) => RequestUser.fromJson(snapshot.data()!),
        toFirestore: (RequestUser user, _) => user.toJson(),
      );

  Future<Result<User>> getProfile(String uid) async {
    try {
      final result = await userDb.doc(uid).get();
      final user = result.data()!;
      return Result.success(user);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }

  Future<Result<String>> updateProfile(RequestUser user) async {
    try {
      await requestUserDb.doc(user.id).update(user.toJson());
      return const Result.success('Success');
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }
}

final commonRepositoryProvider = Provider<CommonRepository>((ref) {
  return CommonRepository();
});
