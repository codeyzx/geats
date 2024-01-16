class Food {
  final String name;
  final int calories;
  final double fat;
  final double proteins;
  final double carbs;
  final double sugars;
  final String image;
  final int qty;

  Food({
    required this.name,
    required this.calories,
    required this.fat,
    required this.proteins,
    required this.carbs,
    required this.sugars,
    required this.image,
    required this.qty,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json['name'] ?? '',
      calories: json['calories'] ?? 0,
      fat: json['fat'] == null ? 0 : json['fat'].toDouble(),
      proteins: json['proteins'] == null ? 0 : json['proteins'].toDouble(),
      carbs: json['carbs'] == null ? 0 : json['carbs'].toDouble(),
      sugars: json['sugars'] == null ? 0 : json['sugars'].toDouble(),
      image: json['image'] ?? '',
      qty: json['qty'] ?? 0,
    );
  }

  factory Food.fromMap(String foodName, Map<String, dynamic> json) {
    return Food(
      name: foodName,
      calories: json['calories'] ?? 0,
      fat: json['fat'] == null ? 0 : json['fat'].toDouble(),
      proteins: json['proteins'] == null ? 0 : json['proteins'].toDouble(),
      carbs: json['carbs'] == null ? 0 : json['carbs'].toDouble(),
      sugars: json['sugars'] == null ? 0 : json['sugars'].toDouble(),
      image: json['image'] ?? '',
      qty: json['qty'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'calories': calories,
      'fat': fat,
      'proteins': proteins,
      'carbs': carbs,
      'sugars': sugars,
      'image': image,
      'qty': qty,
    };
  }

  Food copyWith({
    String? name,
    int? calories,
    double? fat,
    double? proteins,
    double? carbs,
    double? sugars,
    String? image,
    int? qty,
  }) {
    return Food(
      name: name ?? this.name,
      calories: calories ?? this.calories,
      fat: fat ?? this.fat,
      proteins: proteins ?? this.proteins,
      carbs: carbs ?? this.carbs,
      sugars: sugars ?? this.sugars,
      image: image ?? this.image,
      qty: qty ?? this.qty,
    );
  }
}
