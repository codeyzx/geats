class RequestUser {
  final String? id;
  final String? name;
  final double? height;
  final double? weight;
  final int? age;
  final String? activity;
  final String? weightGoal;

  RequestUser({
    this.id,
    this.name,
    this.height,
    this.weight,
    this.age,
    this.activity,
    this.weightGoal,
  });

  factory RequestUser.fromJson(Map<String, dynamic> json) {
    return RequestUser(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      height: json['height'] ?? 0.0,
      weight: json['weight'] ?? 0.0,
      age: json['age'] ?? 0,
      activity: json['activity'] ?? '',
      weightGoal: json['weightGoal'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'height': height,
      'weight': weight,
      'age': age,
      'activity': activity,
      'weightGoal': weightGoal,
    };
  }

  RequestUser copyWith({
    String? id,
    String? name,
    double? height,
    double? weight,
    int? age,
    String? activity,
    String? weightGoal,
  }) {
    return RequestUser(
      id: id ?? this.id,
      name: name ?? this.name,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      activity: activity ?? this.activity,
      weightGoal: weightGoal ?? this.weightGoal,
    );
  }
}
