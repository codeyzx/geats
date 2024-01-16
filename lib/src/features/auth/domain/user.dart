import 'package:geats/src/features/auth/domain/daily_meals.dart';

enum Gender {
  male('Male'),
  female('Female');

  final String value;
  const Gender(this.value);
}

enum Activity {
  rare('Little or no exercise'),
  medium('2-3 exercise/weeks'),
  active('Very active');

  final String value;
  const Activity(this.value);
}

enum WeightGoal {
  gain('Gain weight'),
  maintain('Maintain weight'),
  lose('Lose weight');

  final String value;
  const WeightGoal(this.value);
}

class User {
  final String id;
  final String name;
  final String email;
  final String profileUrl;
  final Gender gender;
  final int coins;
  final double height;
  final double weight;
  final int age;
  final Activity activity;
  final WeightGoal weightGoal;
  final int caloriesGoal;
  final int fatGoal;
  final int proteinsGoal;
  final int carbsGoal;
  final int sugarsGoal;
  List<DailyMeals> dailyMeals;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profileUrl,
    required this.gender,
    required this.coins,
    required this.height,
    required this.weight,
    required this.age,
    required this.activity,
    required this.weightGoal,
    required this.caloriesGoal,
    required this.fatGoal,
    required this.proteinsGoal,
    required this.carbsGoal,
    required this.sugarsGoal,
    this.dailyMeals = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> dailyMealsMap = json['dailyMeals'] ?? {};
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      profileUrl: json['profileUrl'] ?? '',
      gender: Gender.values.firstWhere(
        (e) => e.value == json['gender'],
        orElse: () => Gender.male,
      ),
      coins: json['coins'] ?? 0,
      height: json['height'] == null ? 0 : json['height'].toDouble(),
      weight: json['weight'] == null ? 0 : json['weight'].toDouble(),
      age: json['age'] ?? 0,
      activity: Activity.values.firstWhere(
        (e) => e.value == json['activity'],
        orElse: () => Activity.rare,
      ),
      weightGoal: WeightGoal.values.firstWhere(
        (e) => e.value == json['weightGoal'],
        orElse: () => WeightGoal.maintain,
      ),
      caloriesGoal: json['caloriesGoal'] ?? 0,
      fatGoal: json['fatGoal'] ?? 0,
      proteinsGoal: json['proteinsGoal'] ?? 0,
      carbsGoal: json['carbsGoal'] ?? 0,
      sugarsGoal: json['sugarsGoal'] ?? 0,
      dailyMeals: json['dailyMeals'] == null
          ? []
          : dailyMealsMap.entries
              .map((entry) => DailyMeals.fromJson(entry.value, entry.key))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'profileUrl': profileUrl,
      'gender': gender,
      'coins': coins,
      'height': height,
      'weight': weight,
      'age': age,
      'activity': activity,
      'weightGoal': weightGoal,
      'caloriesGoal': caloriesGoal,
      'fatGoal': fatGoal,
      'proteinsGoal': proteinsGoal,
      'carbsGoal': carbsGoal,
      'sugarsGoal': sugarsGoal,
      'dailyMeals': dailyMeals,
    };
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? profileUrl,
    Gender? gender,
    int? coins,
    double? height,
    double? weight,
    int? age,
    Activity? activity,
    WeightGoal? weightGoal,
    int? caloriesGoal,
    int? fatGoal,
    int? proteinsGoal,
    int? carbsGoal,
    int? sugarsGoal,
    List<DailyMeals>? dailyMeals,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      activity: activity ?? this.activity,
      age: age ?? this.age,
      caloriesGoal: caloriesGoal ?? this.caloriesGoal,
      carbsGoal: carbsGoal ?? this.carbsGoal,
      coins: coins ?? this.coins,
      fatGoal: fatGoal ?? this.fatGoal,
      gender: gender ?? this.gender,
      height: height ?? this.height,
      profileUrl: profileUrl ?? this.profileUrl,
      proteinsGoal: proteinsGoal ?? this.proteinsGoal,
      sugarsGoal: sugarsGoal ?? this.sugarsGoal,
      weight: weight ?? this.weight,
      weightGoal: weightGoal ?? this.weightGoal,
      dailyMeals: dailyMeals ?? this.dailyMeals,
    );
  }
}
