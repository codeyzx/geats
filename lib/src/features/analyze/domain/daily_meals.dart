import 'package:geats/src/features/analyze/domain/meal.dart';
import 'package:geats/src/shared/extensions/extensions.dart';

class DailyMeals {
  final DateTime date;
  final int totalCalories;
  final int totalFat;
  final int totalProteins;
  final int totalCarbs;
  final int totalSugars;
  final List<Meal> meals;

  DailyMeals({
    required this.date,
    required this.totalCalories,
    required this.totalFat,
    required this.totalProteins,
    required this.totalCarbs,
    required this.totalSugars,
    required this.meals,
  });

  factory DailyMeals.fromJson(Map<String, dynamic> json, String date) {
    final foodMap = json['meals'] == null ? [] : json['meals'] as List;
    List<Meal> meals = foodMap.map((e) => Meal.fromJson(e)).toList();
    return DailyMeals(
      date: DateTime.parse(date),
      totalCalories:
          json['totalCalories'] == null ? 0 : json['totalCalories'].toInt(),
      totalFat: json['totalFat'] == null ? 0 : json['totalFat'].toInt(),
      totalProteins:
          json['totalProteins'] == null ? 0 : json['totalProteins'].toInt(),
      totalCarbs: json['totalCarbs'] == null ? 0 : json['totalCarbs'].toInt(),
      totalSugars:
          json['totalSugars'] == null ? 0 : json['totalSugars'].toInt(),
      meals: meals,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'date': date.toYyyyMMDd,
      'totalCalories': totalCalories,
      'totalFat': totalFat,
      'totalProteins': totalProteins,
      'totalCarbs': totalCarbs,
      'totalSugars': totalSugars,
      'meals': meals,
    };
  }

  DailyMeals copyWith({
    int? totalCalories,
    int? totalFat,
    int? totalProteins,
    int? totalCarbs,
    int? totalSugars,
    List<Meal>? meals,
  }) {
    return DailyMeals(
      date: date,
      totalCalories: totalCalories ?? this.totalCalories,
      totalFat: totalFat ?? this.totalFat,
      totalProteins: totalProteins ?? this.totalProteins,
      totalCarbs: totalCarbs ?? this.totalCarbs,
      totalSugars: totalSugars ?? this.totalSugars,
      meals: meals ?? this.meals,
    );
  }
}
