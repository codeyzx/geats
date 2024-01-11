class RequestUser {
  final String? id;
  final String? name;
  final String? polyclinic;
  final int? price;

  RequestUser({
    this.id,
    this.name,
    this.polyclinic,
    this.price,
  });

  factory RequestUser.fromJson(Map<String, dynamic> json) {
    return RequestUser(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      polyclinic: json['polyclinic'] ?? '',
      price: json['price'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'polyclinic': polyclinic,
      'price': price,
    };
  }

  RequestUser copyWith({
    String? id,
    String? name,
    String? polyclinic,
    int? price,
  }) {
    return RequestUser(
      id: id ?? this.id,
      name: name ?? this.name,
      polyclinic: polyclinic ?? this.polyclinic,
      price: price ?? this.price,
    );
  }
}
