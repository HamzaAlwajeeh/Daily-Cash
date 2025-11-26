// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_cash/Features/Restrictions/data/repos/restriction_repo.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/controller/edit_restriction_cubit/edit_restriction_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditRestrictionCubit extends Cubit<EditRestrictionState> {
  RestrictionRepo restrictionRepo;
  EditRestrictionCubit(this.restrictionRepo) : super(EditRestrictionInitial());

  Future<void> editRestriction({
    required int id,
    required String date,
    required double amount,
    required String description,
    required int debitEntityId,
    required int creditEntityId,
  }) async {
    emit(EditRestrictionLoading());
    var result = await restrictionRepo.editRestriction(
      id: id,
      date: date,
      amount: amount,
      description: description,
      debitEntityId: debitEntityId,
      creditEntityId: creditEntityId,
    );
    result.fold(
      (failure) {
        emit(EditRestrictionFailure(failure.errorMessage));
      },
      (_) {
        emit(EditRestrictionSuccess());
      },
    );
  }
}
