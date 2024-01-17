import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/analyze/domain/meal.dart';
import 'package:geats/src/features/analyze/domain/meals.dart';
import 'package:geats/src/features/domain.dart';
import 'package:geats/src/services/services.dart';

class AnalyzeRepository {
  final mealDb = FirebaseFirestore.instance.collection('meals').withConverter(
        fromFirestore: (snapshot, _) => Meal.fromJson(snapshot.data()!),
        toFirestore: (Meal meal, _) => meal.toJson(),
      );

  final mealsDb = FirebaseFirestore.instance.collection('meals').withConverter(
        fromFirestore: (snapshot, _) => Meals.fromJson(snapshot.data()!),
        toFirestore: (Meals meals, _) => meals.toJson(),
      );

  final userDb = FirebaseFirestore.instance.collection('user').withConverter(
        fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
        toFirestore: (User user, _) => user.toJson(),
      );

  Future<Result<List<Meal>>> addMeal(List<Meal> meal, String date) async {
    try {
      final user = auth.FirebaseAuth.instance.currentUser!;

      List<Map<String, dynamic>> mealData =
          meal.map((meal) => meal.toJson()).toList();

      final totalCalories = mealData.fold<num>(
        0,
        (previousValue, element) =>
            previousValue + (element['calories'] * element['qty']),
      );

      final totalFat = mealData.fold<num>(
        0,
        (previousValue, element) =>
            previousValue + (element['fat'] * element['qty']),
      );

      final totalProteins = mealData.fold<num>(
        0,
        (previousValue, element) =>
            previousValue + (element['proteins'] * element['qty']),
      );

      final totalCarbs = mealData.fold<num>(
        0,
        (previousValue, element) =>
            previousValue + (element['carbs'] * element['qty']),
      );

      final totalSugars = mealData.fold<num>(
        0,
        (previousValue, element) =>
            previousValue + (element['sugars'] * element['qty']),
      );

      await userDb.doc(user.uid).collection('dailyMeals').doc(date).set(
        {
          'meals': FieldValue.arrayUnion(mealData),
          'totalCalories': FieldValue.increment(totalCalories),
          'totalFat': FieldValue.increment(totalFat),
          'totalProteins': FieldValue.increment(totalProteins),
          'totalCarbs': FieldValue.increment(totalCarbs),
          'totalSugars': FieldValue.increment(totalSugars),
        },
        SetOptions(merge: true),
      );

      // get today meals
      final data =
          await userDb.doc(user.uid).collection('dailyMeals').doc(date).get();
      List<Meal> meals = [];
      for (final doc in data.data()!['meals']) {
        meals.add(Meal.fromJson(doc));
      }

      return Result.success(meals);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }

  Future<Result<List<Meal>>> getMeals() async {
    try {
      final data = await mealDb.get();
      List<Meal> meals = [];
      for (final doc in data.docs) {
        meals.add(doc.data());
      }
      return Result.success(meals);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }

  Future<Result<String?>> add(List<Meals> meals) async {
    try {
      for (final meal in meals) {
        final ref = mealsDb.doc();
        final temp = meal.copyWith(id: ref.id);
        await ref.set(temp);
      }
      return const Result.success('Success');
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getFirebaseException(e), st);
    }
  }
}

final analyzeRepositoryProvider = Provider<AnalyzeRepository>((ref) {
  return AnalyzeRepository();
});
