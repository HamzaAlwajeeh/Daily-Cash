class Person {
  int id;
  int userId;
  String name;
  String type;
  dynamic phone;
  dynamic notes;
  DateTime? createdAt;
  DateTime? updatedAt;

  Person({
    required this.id,
    required this.userId,
    required this.name,
    required this.type,
    this.phone,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Person(id: $id, userId: $userId, name: $name, type: $type, phone: $phone, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    name: json['name'] as String,
    type: json['type'] as String,
    phone: json['phone'] as dynamic,
    notes: json['notes'] as dynamic,
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    updatedAt:
        json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'name': name,
    'type': type,
    'phone': phone,
    'notes': notes,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };
}
