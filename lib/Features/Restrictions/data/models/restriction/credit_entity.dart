class CreditEntity {
  String name;
  String type;

  CreditEntity({required this.name, required this.type});

  @override
  String toString() {
    return 'CreditEntity(name: $name, type: $type)';
  }

  factory CreditEntity.fromJson(Map<String, dynamic> json) =>
      CreditEntity(name: json['name'] as String, type: json['type'] as String);

  Map<String, dynamic> toJson() => {'name': name, 'type': type};
}
