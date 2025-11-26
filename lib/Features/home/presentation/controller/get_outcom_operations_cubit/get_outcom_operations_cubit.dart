// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_cash/Features/home/data/models/operation.dart';
import 'package:daily_cash/Features/home/data/repos/home_repo.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_outcom_operations_cubit/get_outcom_operations_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetOutcomOperationsCubit extends Cubit<GetOutcomOperationsState> {
  HomeRepo homeRepo;
  List<Operation> operations = [];
  List<Operation> searchList = [];
  List<Operation> todayOperations = [];
  List<Operation> searchTodayOperations = [];
  GetOutcomOperationsCubit(this.homeRepo) : super(GetOutcomOperationsInitial());

  Future<void> getOutcomOperationss() async {
    emit(GetOutcomOperationsLoading());
    var result = await homeRepo.getOutcomeOperations();
    result.fold(
      (failure) =>
          emit(GetOutcomOperationsFailure(errorMessage: failure.errorMessage)),
      (operations) {
        this.operations = operations;
        searchList = operations;
        getTodayOutcomeOperations();
        emit(GetOutcomOperationsSuccess(operations: operations));
      },
    );
  }

  void getTodayOutcomeOperations() {
    todayOperations.clear();
    searchTodayOperations.clear();
    String today = DateTime.now().toIso8601String().split('T').first;

    for (var item in operations) {
      String createdDate = item.createdAt.split('T').first;

      if (createdDate == today) {
        todayOperations.add(item);
        searchTodayOperations.add(item);
      }
    }
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

    emit(GetOutcomOperationsSuccess(operations: searchList));
  }

  void searchTodayOutcomeOperation(String query) {
    if (query.isEmpty) {
      searchTodayOperations = todayOperations;
    } else {
      searchTodayOperations =
          todayOperations
              .where(
                (person) => person.entityName.toLowerCase().contains(
                  query.toLowerCase(),
                ),
              )
              .toList();
    }

    emit(GetOutcomOperationsSuccess(operations: searchTodayOperations));
  }
}
