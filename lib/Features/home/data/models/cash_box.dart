class CashBox {
  int id;
  int userId;
  String totalIncome;
  String totalExpense;
  String balance;
  DateTime createdAt;
  DateTime updatedAt;

  CashBox({
    required this.id,
    required this.userId,
    required this.totalIncome,
    required this.totalExpense,
    required this.balance,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  String toString() {
    return 'CashBox(id: $id, userId: $userId, totalIncome: $totalIncome, totalExpense: $totalExpense, balance: $balance, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory CashBox.fromJson(Map<String, dynamic> json) => CashBox(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    totalIncome: json['total_income'] as String,
    totalExpense: json['total_expense'] as String,
    balance: json['balance'] as String,
    createdAt:
        json['created_at'] = DateTime.parse(json['created_at'] as String),
    updatedAt:
        json['updated_at'] = DateTime.parse(json['updated_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'total_income': totalIncome,
    'total_expense': totalExpense,
    'balance': balance,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
  };
}
