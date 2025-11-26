abstract class DeleteRestrictionState {}

final class DeleteRestrictionInitial extends DeleteRestrictionState {}

final class DeleteRestrictionLoading extends DeleteRestrictionState {}

final class DeleteRestrictionFailure extends DeleteRestrictionState {
  final String message;
  DeleteRestrictionFailure(this.message);
}

final class DeleteRestrictionSuccess extends DeleteRestrictionState {}
