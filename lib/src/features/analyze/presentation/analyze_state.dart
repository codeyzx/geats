import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/auth/domain/daily_meals.dart';
import 'package:geats/src/features/auth/domain/food.dart';

class AnalyzeState {
  final AsyncValue<List<DateTime>> dateValue;
  final AsyncValue<DailyMeals> dailyMealsValue;
  final List<DateTime>? date;
  final DailyMeals? dailyMeals;
  final DateTime? selectedDate;
  final List<Food> todayMeals;
  AnalyzeState({
    this.dateValue = const AsyncLoading(),
    this.dailyMealsValue = const AsyncLoading(),
    this.date,
    this.dailyMeals,
    this.selectedDate,
    this.todayMeals = const [],
  });

  AnalyzeState copyWith({
    AsyncValue<List<DateTime>>? dateValue,
    AsyncValue<DailyMeals>? dailyMealsValue,
    List<DateTime>? date,
    DailyMeals? dailyMeals,
    DateTime? selectedDate,
    List<Food>? todayMeals,
  }) {
    return AnalyzeState(
      dateValue: dateValue ?? this.dateValue,
      dailyMealsValue: dailyMealsValue ?? this.dailyMealsValue,
      date: date ?? this.date,
      dailyMeals: dailyMeals ?? this.dailyMeals,
      selectedDate: selectedDate ?? this.selectedDate,
      todayMeals: todayMeals ?? this.todayMeals,
    );
  }
}
