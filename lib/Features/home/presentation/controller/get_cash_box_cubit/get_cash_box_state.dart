import 'package:daily_cash/Features/home/data/models/cash_box.dart';

abstract class GetCashBoxState {}

final class GetCashBoxInitial extends GetCashBoxState {}

final class GetCashBoxLoading extends GetCashBoxState {}

final class GetCashBoxFailure extends GetCashBoxState {
  final String errorMessage;
  GetCashBoxFailure({required this.errorMessage});
}

final class GetCashBoxSuccess extends GetCashBoxState {
  CashBox cashBox;
  GetCashBoxSuccess({required this.cashBox});
}
