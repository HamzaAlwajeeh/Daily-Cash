import 'package:daily_cash/Features/home/data/models/operation.dart';

abstract class GetAllOperationsState {}

final class GetAllOperationsInitial extends GetAllOperationsState {}

final class GetAllOperationsLoading extends GetAllOperationsState {}

final class GetAllOperationsFailure extends GetAllOperationsState {
  final String errorMessage;
  GetAllOperationsFailure({required this.errorMessage});
}

final class GetAllOperationsSuccess extends GetAllOperationsState {
  List<Operation> operations;
  GetAllOperationsSuccess({required this.operations});
}
