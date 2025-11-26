// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_cash/Features/home/data/repos/home_repo.dart';
import 'package:daily_cash/Features/home/presentation/controller/delete_operation_cubit/delete_operation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteOperationCubit extends Cubit<DeleteOperationState> {
  HomeRepo homeRepo;

  DeleteOperationCubit(this.homeRepo) : super(DeleteOperationInitial());

  Future<void> deleteOperation({required int id}) async {
    emit(DeleteOperationLoading());
    var result = await homeRepo.deleteOperation(id: id);
    result.fold(
      (failure) =>
          emit(DeleteOperationFailure(errorMessage: failure.errorMessage)),
      (_) {
        emit(DeleteOperationSuccess());
      },
    );
  }
}
