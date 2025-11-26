import 'package:daily_cash/Features/home/data/models/operation.dart';

abstract class GetOutcomOperationsState {}

final class GetOutcomOperationsInitial extends GetOutcomOperationsState {}

final class GetOutcomOperationsLoading extends GetOutcomOperationsState {}

final class GetOutcomOperationsFailure extends GetOutcomOperationsState {
  final String errorMessage;
  GetOutcomOperationsFailure({required this.errorMessage});
}

final class GetOutcomOperationsSuccess extends GetOutcomOperationsState {
  List<Operation> operations;
  GetOutcomOperationsSuccess({required this.operations});
}
