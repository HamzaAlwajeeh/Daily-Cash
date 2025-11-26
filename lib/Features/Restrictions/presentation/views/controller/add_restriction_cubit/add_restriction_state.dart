abstract class AddRestrictionState {}

final class AddRestrictionInitial extends AddRestrictionState {}

final class AddRestrictionLoading extends AddRestrictionState {}

final class AddRestrictionFailure extends AddRestrictionState {
  final String message;
  AddRestrictionFailure(this.message);
}

final class AddRestrictionSuccess extends AddRestrictionState {}
