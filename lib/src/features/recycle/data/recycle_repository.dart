import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/recycle/domain/deliver.dart';
import 'package:geats/src/features/recycle/domain/foodbank.dart';
import 'package:geats/src/services/services.dart';

class RecycleRepository {
  final foodBankDb =
      FirebaseFirestore.instance.collection('foodbank').withConverter(
            fromFirestore: (snapshot, _) => FoodBank.fromJson(snapshot.data()!),
            toFirestore: (FoodBank foodbank, _) => foodbank.toJson(),
          );

  final deliverDb =
      FirebaseFirestore.instance.collection('deliver').withConverter(
            fromFirestore: (snapshot, _) => Deliver.fromJson(snapshot.data()!),
            toFirestore: (Deliver foodbank, _) => foodbank.toJson(),
          );

  Future<Result<List<FoodBank>>> getFoodBank() async {
    try {
      final snapshot = await foodBankDb.get();
      final foodbank = snapshot.docs.map((doc) => doc.data()).toList();
      return Result.success(foodbank);
    } catch (e) {
      return Result.failure(
        NetworkExceptions.getDioException(e),
        StackTrace.current,
      );
    }
  }

  Future<Result<List<Deliver>>> getDeliver(String uid) async {
    try {
      final snapshot = await deliverDb.where('uid', isEqualTo: uid).get();
      final deliver = snapshot.docs.map((doc) => doc.data()).toList();
      return Result.success(deliver);
    } catch (e) {
      return Result.failure(
        NetworkExceptions.getDioException(e),
        StackTrace.current,
      );
    }
  }

  Future<Result<String>> addDeliver(Deliver deliver) async {
    try {
      final ref = deliverDb.doc();
      await ref.set(deliver.copyWith(id: ref.id));
      return Result.success(ref.id);
    } catch (e) {
      return Result.failure(
        NetworkExceptions.getDioException(e),
        StackTrace.current,
      );
    }
  }
}

final recycleRepositoryProvider = Provider<RecycleRepository>((ref) {
  return RecycleRepository();
});
