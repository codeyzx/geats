import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/analyze/presentation/analyze_state.dart';
import 'package:geats/src/features/auth/domain/daily_meals.dart';
import 'package:geats/src/shared/extensions/extensions.dart';

class AnalyzeController extends StateNotifier<AnalyzeState> {
  AnalyzeController() : super(AnalyzeState());

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
}

final analyzeControllerProvider =
    StateNotifierProvider<AnalyzeController, AnalyzeState>((ref) {
  return AnalyzeController();
});
