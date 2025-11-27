// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_cash/Features/Persons/data/repos/person_repo.dart';
import 'package:daily_cash/Features/Persons/presentation/controller/delete_person_cubit/delete_person_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeletePersonCubit extends Cubit<DeletePersonState> {
  PersonRepo personRepo;

  DeletePersonCubit(this.personRepo) : super(DeletePersonInitial());

  Future<void> deletePerson({required int id}) async {
    emit(DeletePersonLoading());
    var result = await personRepo.deletePerson(id: id);
    result.fold(
      (failure) =>
          emit(DeletePersonFailure(errorMessage: failure.errorMessage)),
      (_) => emit(DeletePersonSuccess()),
    );
  }
}
