class RestrictionsModel {
  final int id;
  final String fromPerson;
  final String toPerson;
  final double amount;
  final String date;
  final String description;

  RestrictionsModel({
    required this.id,
    required this.fromPerson,
    required this.toPerson,
    required this.amount,
    required this.date,
    required this.description,
  });
}
