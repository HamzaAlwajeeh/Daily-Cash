// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_cash/Features/Persons/data/repos/person_repo.dart';
import 'package:daily_cash/Features/Persons/presentation/controller/add_person_cubit/add_person_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPersonCubit extends Cubit<AddPersonState> {
  PersonRepo personRepo;

  AddPersonCubit(this.personRepo) : super(AddPersonInitial());

  Future<void> addPerson({required String name, required String type}) async {
    emit(AddPersonLoading());
    var result = await personRepo.addPerson(name: name, type: type);
    result.fold(
      (failure) => emit(AddPersonFailure(errorMessage: failure.errorMessage)),
      (user) => emit(AddPersonSuccess()),
    );
  }
}
