abstract class DeletePersonState {}

final class DeletePersonInitial extends DeletePersonState {}

final class DeletePersonLoading extends DeletePersonState {}

final class DeletePersonFailure extends DeletePersonState {
  final String errorMessage;

  DeletePersonFailure({required this.errorMessage});
}

final class DeletePersonSuccess extends DeletePersonState {}
