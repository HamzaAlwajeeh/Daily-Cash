abstract class EditRestrictionState {}

final class EditRestrictionInitial extends EditRestrictionState {}

final class EditRestrictionLoading extends EditRestrictionState {}

final class EditRestrictionFailure extends EditRestrictionState {
  final String message;
  EditRestrictionFailure(this.message);
}

final class EditRestrictionSuccess extends EditRestrictionState {}
