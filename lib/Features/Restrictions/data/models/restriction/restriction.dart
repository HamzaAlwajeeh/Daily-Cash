import 'credit_entity.dart';
import 'debit_entity.dart';

class Restriction {
  int id;
  int userId;
  String date;
  String amount;
  String description;
  int debitEntityId;
  int creditEntityId;
  dynamic revenueExpenseId;
  DateTime createdAt;
  DateTime updatedAt;
  DebitEntity debitEntity;
  CreditEntity creditEntity;

  Restriction({
    required this.id,
    required this.userId,
    required this.date,
    required this.amount,
    required this.description,
    required this.debitEntityId,
    required this.creditEntityId,
    this.revenueExpenseId,
    required this.createdAt,
    required this.updatedAt,
    required this.debitEntity,
    required this.creditEntity,
  });

  @override
  String toString() {
    return 'Restriction(id: $id, userId: $userId, date: $date, amount: $amount, description: $description, debitEntityId: $debitEntityId, creditEntityId: $creditEntityId, revenueExpenseId: $revenueExpenseId, createdAt: $createdAt, updatedAt: $updatedAt, debitEntity: $debitEntity, creditEntity: $creditEntity)';
  }

  factory Restriction.fromJson(Map<String, dynamic> json) => Restriction(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    date: json['date'] as String,
    amount: json['amount'] as String,
    description: json['description'] as String,
    debitEntityId: json['debit_entity_id'] as int,
    creditEntityId: json['credit_entity_id'] as int,
    revenueExpenseId: json['revenue_expense_id'] as dynamic,
    createdAt:
        json['created_at'] = DateTime.parse(json['created_at'] as String),
    updatedAt:
        json['updated_at'] = DateTime.parse(json['updated_at'] as String),
    debitEntity:
        json['debit_entity'] = DebitEntity.fromJson(
          json['debit_entity'] as Map<String, dynamic>,
        ),
    creditEntity:
        json['credit_entity'] = CreditEntity.fromJson(
          json['credit_entity'] as Map<String, dynamic>,
        ),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'date': date,
    'amount': amount,
    'description': description,
    'debit_entity_id': debitEntityId,
    'credit_entity_id': creditEntityId,
    'revenue_expense_id': revenueExpenseId,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'debit_entity': debitEntity.toJson(),
    'credit_entity': creditEntity.toJson(),
  };
}
