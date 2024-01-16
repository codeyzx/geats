import 'package:geats/src/features/auth/domain/food.dart';
import 'package:geats/src/shared/extensions/extensions.dart';

class DailyMeals {
  final DateTime date;
  final int totalCalories;
  final int totalFat;
  final int totalProteins;
  final int totalCarbs;
  final int totalSugars;
  final List<Food> meals;

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
    Map<String, dynamic> foodMap = json['meals'] ?? {};
    return DailyMeals(
      date: DateTime.parse(date),
      totalCalories: json['totalCalories'] ?? 0,
      totalFat: json['totalFat'] ?? 0,
      totalProteins: json['totalProteins'] ?? 0,
      totalCarbs: json['totalCarbs'] ?? 0,
      totalSugars: json['totalSugars'] ?? 0,
      meals: json['meals'] == null
          ? []
          : foodMap.entries
              .map((entry) => Food.fromMap(entry.key, entry.value))
              .toList(),
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
    List<Food>? meals,
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
