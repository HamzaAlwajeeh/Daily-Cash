class User {
  String name;
  String email;
  // DateTime? updatedAt;
  // DateTime? createdAt;
  int id;

  User({
    required this.name,
    required this.email,
    // this.updatedAt,
    // this.createdAt,
    required this.id,
  });

  @override
  String toString() {
    return 'User(name: $name, email: $email, updatedAt: updatedAt, createdAt: createdAt, id: $id)';
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json['name'] as String,
    email: json['email'] as String,
    // updatedAt:
    //     json['updated_at'] == null
    //         ? null
    //         : DateTime.parse(json['updated_at'] as String),
    // createdAt:
    //     json['created_at'] == null
    //         ? null
    //         : DateTime.parse(json['created_at'] as String),
    id: json['id'] as int,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    // 'updated_at': updatedAt?.toIso8601String(),
    // 'created_at': createdAt?.toIso8601String(),
    'id': id,
  };
}
