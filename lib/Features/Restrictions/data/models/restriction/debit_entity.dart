class DebitEntity {
  String name;
  String type;

  DebitEntity({required this.name, required this.type});

  @override
  String toString() {
    return 'DebitEntity(name: $name, type: $type)';
  }

  factory DebitEntity.fromJson(Map<String, dynamic> json) =>
      DebitEntity(name: json['name'] as String, type: json['type'] as String);

  Map<String, dynamic> toJson() => {'name': name, 'type': type};
}
