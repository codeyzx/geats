import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/analyze/data/analyze_repository.dart';
import 'package:geats/src/features/analyze/domain/meal.dart';
import 'package:geats/src/features/analyze/domain/meals.dart';
import 'package:geats/src/services/services.dart';

class AnalyzeService {
  final AnalyzeRepository _analyzeRepository;

  AnalyzeService(
    this._analyzeRepository,
  );

  Future<Result<List<Meal>>> addMeal(List<Meal> meal, String date) async {
    final result = await _analyzeRepository.addMeal(meal, date);
    return result.when(
      success: (data) {
        return Result.success(data);
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  Future<Result<List<Meal>>> getMeals() async {
    final result = await _analyzeRepository.getMeals();
    return result.when(
      success: (data) {
        return Result.success(data);
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  Future<Result<String?>> add(List<Meals> meals) async {
    final result = await _analyzeRepository.add(meals);
    return result.when(
      success: (data) {
        return Result.success(data);
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }
}

final analyzeServiceProvider = Provider<AnalyzeService>((ref) {
  final analyzeRepository = ref.read(analyzeRepositoryProvider);
  return AnalyzeService(analyzeRepository);
});
