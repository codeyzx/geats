
class User {
  final String id;
  final String name;
  final String email;
  final String profileUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profileUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      profileUrl: json['profile_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'profile_url': profileUrl,
    };
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? profileUrl,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileUrl: profileUrl ?? this.profileUrl,
    );
  }
}
