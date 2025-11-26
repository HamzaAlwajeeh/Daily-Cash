// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_cash/Features/home/data/models/operation.dart';
import 'package:daily_cash/Features/home/data/repos/home_repo.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_all_operation_cubit/get_all_operation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllOperationsCubit extends Cubit<GetAllOperationsState> {
  HomeRepo homeRepo;
  List<Operation> operations = [];
  List<Operation> searchList = [];
  double totalIncome = 0.0;
  double totalExpense = 0.0;
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
        getSummary();
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

  void getSummary() {
    totalExpense = 0;
    totalIncome = 0;
    String today = DateTime.now().toIso8601String().split('T').first;

    for (var item in operations) {
      String createdDate = item.createdAt.split('T').first;

      if (createdDate == today) {
        double amount = double.tryParse(item.amount.toString()) ?? 0.0;

        if (item.type == "income") {
          totalIncome += amount;
        } else if (item.type == "expense") {
          totalExpense += amount;
        }
      }
    }
  }
}
