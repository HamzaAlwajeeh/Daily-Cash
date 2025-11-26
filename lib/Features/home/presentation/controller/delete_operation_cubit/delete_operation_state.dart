abstract class DeleteOperationState {}

final class DeleteOperationInitial extends DeleteOperationState {}

final class DeleteOperationLoading extends DeleteOperationState {}

final class DeleteOperationFailure extends DeleteOperationState {
  final String errorMessage;
  DeleteOperationFailure({required this.errorMessage});
}

final class DeleteOperationSuccess extends DeleteOperationState {}
