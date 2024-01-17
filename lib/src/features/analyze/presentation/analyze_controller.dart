import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/analyze/application/analyze_service.dart';
import 'package:geats/src/features/analyze/domain/meal.dart';
import 'package:geats/src/features/analyze/domain/meals.dart';
import 'package:geats/src/features/analyze/presentation/analyze_state.dart';
import 'package:geats/src/features/analyze/domain/daily_meals.dart';
import 'package:geats/src/shared/extensions/extensions.dart';

class AnalyzeController extends StateNotifier<AnalyzeState> {
  final AnalyzeService _analyzeService;

  AnalyzeController(this._analyzeService) : super(AnalyzeState());

  final searchController = TextEditingController();

  void getDate() {
    state = state.copyWith(
      dateValue: const AsyncLoading(),
    );

    final now = DateTime.now();
    final dateTemp = List.generate(10, (index) {
      return now.subtract(Duration(days: index));
    });
    final date = dateTemp.reversed.toList();
    state = state.copyWith(
      date: date,
      dateValue: AsyncData(date),
    );
  }

  void getDailyMeals(DateTime date, List<DailyMeals>? dailyMeals) {
    state = state.copyWith(
      dailyMealsValue: const AsyncLoading(),
    );

    DailyMeals? temp = dailyMeals?.firstWhere(
      (element) => element.date.toYyyyMMDd == date.toYyyyMMDd,
      orElse: () => DailyMeals(
        date: date,
        totalCalories: 0,
        totalFat: 0,
        totalProteins: 0,
        totalCarbs: 0,
        totalSugars: 0,
        meals: [],
      ),
    );

    state = state.copyWith(
      dailyMeals: temp,
      dailyMealsValue: AsyncData(temp!),
      selectedDate: date,
      todayMeals: temp.meals,
    );
  }

  Future<void> getMeals() async {
    state = state.copyWith(
      mealsValue: const AsyncLoading(),
    );

    final result = await _analyzeService.getMeals();

    result.when(
      success: (data) {
        state = state.copyWith(
          meals: data,
          mealsValue: AsyncData(data),
          searchMeals: data,
          searchMealsValue: AsyncData(data),
          searchResults: [],
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          mealsValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void addQtyMeal(String id) {
    final temp = state.meals!;
    final index = temp.indexWhere((element) => element.id == id);
    temp[index] = temp[index].copyWith(
      qty: temp[index].qty + 1,
    );
    state = state.copyWith(
      searchMeals: temp,
      searchResults: temp,
    );
  }

  void removeQtyMeal(String id) {
    final temp = state.meals!;
    final index = temp.indexWhere((element) => element.id == id);
    if (temp[index].qty > 1) {
      temp[index] = temp[index].copyWith(
        qty: temp[index].qty - 1,
      );
    }
    state = state.copyWith(
      searchMeals: temp,
      searchResults: temp,
    );
  }

  void selectMeal(String id) {
    final temp = state.meals!;
    final index = temp.indexWhere((element) => element.id == id);
    temp[index] = temp[index].copyWith(
      isSelected: !temp[index].isSelected!,
    );
    state = state.copyWith(
      searchMeals: temp,
      searchResults: temp,
    );
  }

  void searchMeal(String query) {
    if (query.isEmpty) {
      state = state.copyWith(
        searchMeals: state.meals ?? [],
        searchMealsValue: AsyncData(state.meals ?? []),
      );
    }
    state = state.copyWith(
      searchMealsValue: const AsyncLoading(),
    );
    List<Meal> meals = state.meals ?? [];
    final result = meals
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    state = state.copyWith(
      searchMeals: result,
      searchMealsValue: AsyncData(result),
    );
  }

  Future<void> addMeal(List<Meal> meal, String date) async {
    state = state.copyWith(
      todayMealsValue: const AsyncLoading(),
    );

    final result = await _analyzeService.addMeal(meal, date);

    result.when(
      success: (data) {
        state = state.copyWith(
          todayMeals: data,
          todayMealsValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          todayMealsValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  Future<void> add() async {
    List<Meals> meals = [
      Meals(
        name: 'Burger',
        calories: 163,
        fat: 10,
        proteins: 20,
        carbs: 30,
        sugars: 10,
        image: '',
      ),
      Meals(
        name: 'Pizza',
        calories: 241,
        fat: 20,
        proteins: 30,
        carbs: 40,
        sugars: 20,
        image: '',
      ),
      Meals(
        name: 'Pasta',
        calories: 213,
        fat: 30,
        proteins: 40,
        carbs: 50,
        sugars: 30,
        image: '',
      ),
      Meals(
        name: 'Salad',
        calories: 40,
        fat: 40,
        proteins: 50,
        carbs: 60,
        sugars: 40,
        image: '',
      ),
      Meals(
        name: 'Fries',
        calories: 125,
        fat: 50,
        proteins: 60,
        carbs: 70,
        sugars: 50,
        image: '',
      ),
      Meals(
        name: 'Sandwich',
        calories: 60,
        fat: 60,
        proteins: 70,
        carbs: 80,
        sugars: 60,
        image: '',
      ),
      Meals(
        name: 'Chicken',
        calories: 220,
        fat: 70,
        proteins: 80,
        carbs: 90,
        sugars: 70,
        image: '',
      ),
      Meals(
        name: 'Rice',
        calories: 124,
        fat: 80,
        proteins: 90,
        carbs: 100,
        sugars: 80,
        image: '',
      ),
    ];

    await _analyzeService.add(meals);
  }
}

final analyzeControllerProvider =
    StateNotifierProvider<AnalyzeController, AnalyzeState>((ref) {
  final analyzeService = ref.read(analyzeServiceProvider);
  return AnalyzeController(analyzeService);
});
