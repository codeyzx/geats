import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/analyze/domain/daily_meals.dart';
import 'package:geats/src/features/analyze/domain/meal.dart';

class AnalyzeState {
  final AsyncValue<List<DateTime>> dateValue;
  final AsyncValue<DailyMeals> dailyMealsValue;
  final AsyncValue<List<Meal>> mealsValue;
  final AsyncValue<List<Meal>> searchMealsValue;
  final AsyncValue<List<Meal>> todayMealsValue;
  final List<DateTime>? date;
  final DailyMeals? dailyMeals;
  final DateTime? selectedDate;
  final List<Meal> todayMeals;
  final List<Meal>? meals;
  final List<Meal>? searchMeals;
  final List<Meal> searchResults;
  AnalyzeState({
    this.dateValue = const AsyncLoading(),
    this.dailyMealsValue = const AsyncLoading(),
    this.mealsValue = const AsyncLoading(),
    this.searchMealsValue = const AsyncLoading(),
    this.todayMealsValue = const AsyncLoading(),
    this.date,
    this.dailyMeals,
    this.selectedDate,
    this.todayMeals = const [],
    this.meals,
    this.searchMeals,
    this.searchResults = const [],
  });

  AnalyzeState copyWith({
    AsyncValue<List<DateTime>>? dateValue,
    AsyncValue<DailyMeals>? dailyMealsValue,
    AsyncValue<List<Meal>>? mealsValue,
    AsyncValue<List<Meal>>? searchMealsValue,
    AsyncValue<List<Meal>>? todayMealsValue,
    List<DateTime>? date,
    DailyMeals? dailyMeals,
    DateTime? selectedDate,
    List<Meal>? todayMeals,
    List<Meal>? meals,
    List<Meal>? searchMeals,
    List<Meal>? searchResults,
  }) {
    return AnalyzeState(
      dateValue: dateValue ?? this.dateValue,
      dailyMealsValue: dailyMealsValue ?? this.dailyMealsValue,
      todayMealsValue: todayMealsValue ?? this.mealsValue,
      date: date ?? this.date,
      dailyMeals: dailyMeals ?? this.dailyMeals,
      selectedDate: selectedDate ?? this.selectedDate,
      todayMeals: todayMeals ?? this.todayMeals,
      meals: meals ?? this.meals,
      mealsValue: mealsValue ?? this.mealsValue,
      searchMeals: searchMeals ?? this.searchMeals,
      searchMealsValue: searchMealsValue ?? this.searchMealsValue,
      searchResults: searchResults ?? this.searchResults,
    );
  }
}
