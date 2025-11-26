abstract class EditRestrictionState {}

final class EditRestrictionInitial extends EditRestrictionState {}

final class EditRestrictionLoading extends EditRestrictionState {}

final class EditRestrictionFailure extends EditRestrictionState {
  final String errorMessage;
  EditRestrictionFailure(this.errorMessage);
}

final class EditRestrictionSuccess extends EditRestrictionState {}
