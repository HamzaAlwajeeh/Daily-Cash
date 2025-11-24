abstract class AddPersonState {}

final class AddPersonInitial extends AddPersonState {}

final class AddPersonLoading extends AddPersonState {}

final class AddPersonFailure extends AddPersonState {
  final String errorMessage;

  AddPersonFailure({required this.errorMessage});
}

final class AddPersonSuccess extends AddPersonState {}
