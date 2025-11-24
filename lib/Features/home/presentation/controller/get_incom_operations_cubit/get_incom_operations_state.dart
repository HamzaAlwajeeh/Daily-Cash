import 'package:daily_cash/Features/home/data/models/operation.dart';

abstract class GetIncomOperationsState {}

final class GetIncomOperationsInitial extends GetIncomOperationsState {}

final class GetIncomOperationsLoading extends GetIncomOperationsState {}

final class GetIncomOperationsFailure extends GetIncomOperationsState {
  final String errorMessage;
  GetIncomOperationsFailure({required this.errorMessage});
}

final class GetIncomOperationsSuccess extends GetIncomOperationsState {
  List<Operation> operations;
  GetIncomOperationsSuccess({required this.operations});
}
