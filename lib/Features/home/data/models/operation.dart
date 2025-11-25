class Operation {
  int id;
  String type;
  String date;
  String amount;
  String description;
  int entityId;
  String entityName;
  int? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  Operation({
    required this.id,
    required this.type,
    required this.date,
    required this.amount,
    required this.description,
    required this.entityId,
    required this.entityName,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Operation(id: $id, type: $type, date: $date, amount: $amount, description: $description, entityId: $entityId, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt , entityName: $entityName)';
  }

  factory Operation.fromJson(Map<String, dynamic> json) => Operation(
    id: json['id'] as int,
    type: json['type'] as String,
    date: json['date'] as String,
    amount: json['amount'] as String,
    description: json['description'] as String,
    entityId: json['entity']['id'] as int,
    entityName: json['entity']['name'] as String,
    createdBy: json['created_by'] as int?,
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
    'type': type,
    'date': date,
    'amount': amount,
    'description': description,
    'entity_id': entityId,
    'created_by': createdBy,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };
}
