// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_cash/Features/home/data/models/operation.dart';
import 'package:daily_cash/Features/home/data/repos/home_repo.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_all_operation_cubit/get_all_operation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllOperationsCubit extends Cubit<GetAllOperationsState> {
  HomeRepo homeRepo;
  List<Operation> operations = [];
  List<Operation> searchList = [];
  GetAllOperationsCubit(this.homeRepo) : super(GetAllOperationsInitial());

  Future<void> getAllOperationss() async {
    emit(GetAllOperationsLoading());
    var result = await homeRepo.getAllOperations();
    result.fold(
      (failure) =>
          emit(GetAllOperationsFailure(errorMessage: failure.errorMessage)),
      (operations) {
        this.operations = operations;
        searchList = operations;
        emit(GetAllOperationsSuccess(operations: operations));
      },
    );
  }

  void searchOperation(String query) {
    if (query.isEmpty) {
      searchList = operations;
    } else {
      searchList =
          operations
              .where(
                (person) => person.entityName.toLowerCase().contains(
                  query.toLowerCase(),
                ),
              )
              .toList();
    }

    emit(GetAllOperationsSuccess(operations: searchList));
  }
}
