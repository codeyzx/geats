import 'package:geats/src/shared/extensions/extensions.dart';

enum RoleUser {
  user('USER'),
  superadmin('SUPERADMIN'),
  doctor('DOCTOR');

  final String value;
  const RoleUser(this.value);
}

class User {
  final String id;
  final String name;
  final String polyclinic;
  final String email;
  final String phone;
  final int price;
  final RoleUser role;
  final DateTime createdAt;
  final String profileUrl;
  final String clinicId;
  final bool isVerified;

  User({
    required this.id,
    required this.name,
    required this.polyclinic,
    required this.email,
    required this.phone,
    required this.price,
    required this.role,
    required this.createdAt,
    required this.profileUrl,
    required this.clinicId,
    required this.isVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      polyclinic: json['polyclinic'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      price: json['price'] ?? 0,
      role: json['role'].toString().toUpperCase().roleUser,
      createdAt: json['created_at'].toDate(),
      profileUrl: json['profile_url'] ?? '',
      clinicId: json['clinic_id'] ?? '',
      isVerified: json['is_verified'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'polyclinic': polyclinic,
      'email': email,
      'phone': phone,
      'price': price,
      'role': role.value,
      'created_at': createdAt,
      'profile_url': profileUrl,
      'clinic_id': clinicId,
      'is_verified': isVerified,
    };
  }

  User copyWith({
    String? id,
    String? name,
    String? polyclinic,
    String? email,
    String? phone,
    int? price,
    RoleUser? role,
    DateTime? createdAt,
    String? profileUrl,
    String? clinicId,
    bool? isVerified,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      polyclinic: polyclinic ?? this.polyclinic,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      price: price ?? this.price,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      profileUrl: profileUrl ?? this.profileUrl,
      clinicId: clinicId ?? this.clinicId,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}
