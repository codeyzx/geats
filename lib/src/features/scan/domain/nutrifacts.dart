class NutriFacts {
  final String name;
  final double calories;
  final double fat;
  final double carbs;
  final double proteins;

  NutriFacts({
    required this.name,
    required this.calories,
    required this.fat,
    required this.carbs,
    required this.proteins,
  });

  factory NutriFacts.fromJson(Map<String, dynamic> json) {
    return NutriFacts(
      name: json['product_name'] ?? '',
      calories: json['nutriments']['energy-kcal'] == null
          ? 0
          : json['nutriments']['energy-kcal'].toDouble(),
      fat: json['nutriments']['fat'] == null
          ? 0
          : json['nutriments']['fat'].toDouble(),
      carbs: json['nutriments']['carbsohydrates'] == null
          ? 0
          : json['nutriments']['carbsohydrates'].toDouble(),
      proteins: json['nutriments']['proteins'] == null
          ? 0
          : json['nutriments']['proteins'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'calories': calories,
      'fat': fat,
      'carbs': carbs,
      'proteins': proteins,
    };
  }

  NutriFacts copyWith({
    String? name,
    double? calories,
    double? fat,
    double? carbs,
    double? proteins,
  }) {
    return NutriFacts(
      name: name ?? this.name,
      calories: calories ?? this.calories,
      fat: fat ?? this.fat,
      carbs: carbs ?? this.carbs,
      proteins: proteins ?? this.proteins,
    );
  }
}
