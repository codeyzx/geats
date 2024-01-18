class Deliver {
  final String id;
  final String uid;
  final String type;
  final String condition;
  final String location;
  final String weight;
  final String desc;
  final DateTime timestamp;
  final String status;
  final int coins;

  Deliver({
    required this.id,
    required this.uid,
    required this.type,
    required this.condition,
    required this.location,
    required this.weight,
    required this.desc,
    required this.timestamp,
    required this.status,
    required this.coins,
  });

  Deliver copyWith({
    String? id,
    String? uid,
    String? type,
    String? condition,
    String? location,
    String? weight,
    String? desc,
    DateTime? timestamp,
    String? status,
    int? coins,
  }) {
    return Deliver(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      type: type ?? this.type,
      condition: condition ?? this.condition,
      location: location ?? this.location,
      weight: weight ?? this.weight,
      desc: desc ?? this.desc,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
      coins: coins ?? this.coins,
    );
  }

  factory Deliver.fromJson(Map<String, dynamic> json) {
    return Deliver(
      id: json['id'] ?? '',
      uid: json['uid'] ?? '',
      type: json['type'] ?? '',
      condition: json['condition'] ?? '',
      location: json['location'] ?? '',
      weight: json['weight'] ?? '',
      desc: json['desc'] ?? '',
      timestamp: json['timestamp'] == null
          ? DateTime.now()
          : DateTime.fromMillisecondsSinceEpoch(json['timestamp']),
      status: json['status'] ?? '',
      coins: json['coins'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'type': type,
      'condition': condition,
      'location': location,
      'weight': weight,
      'desc': desc,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'status': status,
      'coins': coins,
    };
  }
}
