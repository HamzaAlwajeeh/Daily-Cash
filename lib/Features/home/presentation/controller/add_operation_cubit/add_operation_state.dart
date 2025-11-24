abstract class AddOperationState {}

final class AddOperationInitial extends AddOperationState {}

final class AddOperationLoading extends AddOperationState {}

final class AddOperationFailure extends AddOperationState {
  final String errorMessage;
  AddOperationFailure({required this.errorMessage});
}

final class AddOperationSuccess extends AddOperationState {}
