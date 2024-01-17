class Meal {
  final String id;
  final String name;
  final int calories;
  final double fat;
  final double proteins;
  final double carbs;
  final double sugars;
  final String image;
  final int qty;
  final bool? isSelected;

  Meal({
    required this.id,
    required this.name,
    required this.calories,
    required this.fat,
    required this.proteins,
    required this.carbs,
    required this.sugars,
    required this.image,
    this.qty = 1,
    this.isSelected = false,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      calories: json['calories'] ?? 0,
      fat: json['fat'] == null ? 0 : json['fat'].toDouble(),
      proteins: json['proteins'] == null ? 0 : json['proteins'].toDouble(),
      carbs: json['carbs'] == null ? 0 : json['carbs'].toDouble(),
      sugars: json['sugars'] == null ? 0 : json['sugars'].toDouble(),
      image: json['image'] ?? '',
      qty: json['qty'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
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

  Meal copyWith({
    String? id,
    String? name,
    int? calories,
    double? fat,
    double? proteins,
    double? carbs,
    double? sugars,
    String? image,
    int? qty,
    bool? isSelected,
  }) {
    return Meal(
      id: id ?? this.id,
      name: name ?? this.name,
      calories: calories ?? this.calories,
      fat: fat ?? this.fat,
      proteins: proteins ?? this.proteins,
      carbs: carbs ?? this.carbs,
      sugars: sugars ?? this.sugars,
      image: image ?? this.image,
      qty: qty ?? this.qty,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
