// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_cash/Features/home/data/models/operation.dart';
import 'package:daily_cash/Features/home/data/repos/home_repo.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_outcom_operations_cubit%20copy/get_outcom_operations_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetOutcomOperationsCubit extends Cubit<GetOutcomOperationsState> {
  HomeRepo homeRepo;
  List<Operation> operations = [];
  GetOutcomOperationsCubit(this.homeRepo) : super(GetOutcomOperationsInitial());

  Future<void> getOutcomOperationss() async {
    emit(GetOutcomOperationsLoading());
    var result = await homeRepo.getOutcomeOperations();
    result.fold(
      (failure) =>
          emit(GetOutcomOperationsFailure(errorMessage: failure.errorMessage)),
      (operations) {
        this.operations = operations;
        emit(GetOutcomOperationsSuccess(operations: operations));
      },
    );
  }
}
