abstract class AddRestrictionState {}

final class AddRestrictionInitial extends AddRestrictionState {}

final class AddRestrictionLoading extends AddRestrictionState {}

final class AddRestrictionFailure extends AddRestrictionState {
  final String errorMessage;
  AddRestrictionFailure(this.errorMessage);
}

final class AddRestrictionSuccess extends AddRestrictionState {}
