class FoodBank {
  final String id;
  final String name;
  final String address;
  final String closeAt;
  final String openAt;
  final String image;

  FoodBank({
    required this.id,
    required this.name,
    required this.address,
    required this.closeAt,
    required this.openAt,
    required this.image,
  });

  FoodBank copyWith({
    String? id,
    String? name,
    String? address,
    String? closeAt,
    String? openAt,
    String? image,
  }) {
    return FoodBank(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      closeAt: closeAt ?? this.closeAt,
      openAt: openAt ?? this.openAt,
      image: image ?? this.image,
    );
  }

  factory FoodBank.fromJson(Map<String, dynamic> json) {
    return FoodBank(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      closeAt: json['closeAt'] ?? '',
      openAt: json['openAt'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'closeAt': closeAt,
      'openAt': openAt,
      'image': image,
    };
  }
}
