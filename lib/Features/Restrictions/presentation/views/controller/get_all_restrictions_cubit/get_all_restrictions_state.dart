import 'package:daily_cash/Features/Restrictions/data/models/restriction/restriction.dart';

abstract class GetAllRestrictionsState {}

final class GetAllRestrictionsInitial extends GetAllRestrictionsState {}

final class GetAllRestrictionsLoading extends GetAllRestrictionsState {}

final class GetAllRestrictionsFailure extends GetAllRestrictionsState {
  final String errorMessage;
  GetAllRestrictionsFailure(this.errorMessage);
}

final class GetAllRestrictionsSuccess extends GetAllRestrictionsState {
  List<Restriction> restrictions;
  GetAllRestrictionsSuccess(this.restrictions);
}
