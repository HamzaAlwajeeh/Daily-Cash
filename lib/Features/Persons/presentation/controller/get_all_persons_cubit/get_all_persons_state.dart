import 'package:daily_cash/Features/Persons/data/models/person.dart';

abstract class GetAllPersonsState {}

final class GetAllPersonsInitial extends GetAllPersonsState {}

final class GetAllPersonsLoading extends GetAllPersonsState {}

final class GetAllPersonsFailure extends GetAllPersonsState {
  final String errorMessage;

  GetAllPersonsFailure({required this.errorMessage});
}

final class GetAllPersonsSuccess extends GetAllPersonsState {
  final List<Person> persons;

  GetAllPersonsSuccess({required this.persons});
}
