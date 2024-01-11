class RequestUser {
  final String? id;
  final String? name;

  RequestUser({
    this.id,
    this.name,
  });

  factory RequestUser.fromJson(Map<String, dynamic> json) {
    return RequestUser(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  RequestUser copyWith({
    String? id,
    String? name,
  }) {
    return RequestUser(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
