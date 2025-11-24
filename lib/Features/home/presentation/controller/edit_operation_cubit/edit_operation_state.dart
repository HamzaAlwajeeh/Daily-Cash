abstract class EditOperationState {}

final class EditOperationInitial extends EditOperationState {}

final class EditOperationLoading extends EditOperationState {}

final class EditOperationFailure extends EditOperationState {
  final String errorMessage;
  EditOperationFailure({required this.errorMessage});
}

final class EditOperationSuccess extends EditOperationState {}
