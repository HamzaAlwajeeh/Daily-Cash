// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_cash/Features/Persons/data/models/person.dart';
import 'package:daily_cash/Features/Persons/data/repos/person_repo.dart';
import 'package:daily_cash/Features/Persons/presentation/controller/get_all_persons_cubit/get_all_persons_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllPersonsCubit extends Cubit<GetAllPersonsState> {
  PersonRepo personRepo;
  List<Person> persons = [];
  GetAllPersonsCubit(this.personRepo) : super(GetAllPersonsInitial());

  Future<void> getAllPersons() async {
    emit(GetAllPersonsLoading());
    var result = await personRepo.getAllPersons();
    result.fold(
      (failure) =>
          emit(GetAllPersonsFailure(errorMessage: failure.errorMessage)),
      (person) {
        persons = person;
        emit(GetAllPersonsSuccess(persons: persons));
      },
    );
  }
}
