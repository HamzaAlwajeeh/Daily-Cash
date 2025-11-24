// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_cash/Features/home/data/repos/home_repo.dart';
import 'package:daily_cash/Features/home/presentation/controller/add_operation_cubit/add_operation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOperationCubit extends Cubit<AddOperationState> {
  HomeRepo homeRepo;
  AddOperationCubit(this.homeRepo) : super(AddOperationInitial());

  Future<void> addOperation({
    required String type,
    required DateTime date,
    required double amount,
    required String description,
    required int personId,
  }) async {
    emit(AddOperationLoading());
    var result = await homeRepo.addOperation(
      type: type,
      date: date,
      amount: amount,
      description: description,
      personId: personId,
    );
    result.fold(
      (failure) =>
          emit(AddOperationFailure(errorMessage: failure.errorMessage)),
      (message) => emit(AddOperationSuccess()),
    );
  }
}
