// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_cash/Features/home/data/models/cash_box.dart';
import 'package:daily_cash/Features/home/data/repos/home_repo.dart';
import 'package:daily_cash/Features/home/presentation/controller/get_cash_box_cubit/get_cash_box_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCashBoxCubit extends Cubit<GetCashBoxState> {
  HomeRepo homeRepo;
  CashBox? cashBox;
  GetCashBoxCubit(this.homeRepo) : super(GetCashBoxInitial());

  Future<void> getCashBox() async {
    emit(GetCashBoxInitial());
    var result = await homeRepo.getCashBox();
    result.fold(
      (failure) => emit(GetCashBoxFailure(errorMessage: failure.errorMessage)),
      (cashBox) {
        this.cashBox = cashBox;
        emit(GetCashBoxSuccess(cashBox: cashBox));
      },
    );
  }
}
