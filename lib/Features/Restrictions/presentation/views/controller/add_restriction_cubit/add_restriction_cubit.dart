// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_cash/Features/Restrictions/data/repos/restriction_repo.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/controller/add_restriction_cubit/add_restriction_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRestrictionCubit extends Cubit<AddRestrictionState> {
  RestrictionRepo restrictionRepo;
  AddRestrictionCubit(this.restrictionRepo) : super(AddRestrictionInitial());

  Future<void> addRestriction({
    required String date,
    required double amount,
    required String description,
    required int debitEntityId,
    required int creditEntityId,
  }) async {
    emit(AddRestrictionLoading());
    var result = await restrictionRepo.addRestriction(
      date: date,
      amount: amount,
      description: description,
      debitEntityId: debitEntityId,
      creditEntityId: creditEntityId,
    );
    result.fold(
      (failure) {
        emit(AddRestrictionFailure(failure.errorMessage));
      },
      (_) {
        emit(AddRestrictionSuccess());
      },
    );
  }
}
