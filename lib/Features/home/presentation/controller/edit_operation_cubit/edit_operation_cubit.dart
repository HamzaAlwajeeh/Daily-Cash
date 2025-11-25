// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_cash/Features/home/data/repos/home_repo.dart';
import 'package:daily_cash/Features/home/presentation/controller/edit_operation_cubit/edit_operation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditOperationCubit extends Cubit<EditOperationState> {
  HomeRepo homeRepo;
  EditOperationCubit(this.homeRepo) : super(EditOperationInitial());

  Future<void> editOperation({
    required int id,
    required String type,
    required String date,
    required double amount,
    required String description,
    required int personId,
  }) async {
    emit(EditOperationLoading());
    var result = await homeRepo.editOperation(
      id: id,
      type: type,
      date: date,
      amount: amount,
      description: description,
      personId: personId,
    );
    result.fold(
      (failure) =>
          emit(EditOperationFailure(errorMessage: failure.errorMessage)),
      (message) => emit(EditOperationSuccess()),
    );
  }
}
