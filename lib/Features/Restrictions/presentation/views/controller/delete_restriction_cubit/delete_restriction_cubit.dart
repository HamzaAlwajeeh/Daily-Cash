// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_cash/Features/Restrictions/data/repos/restriction_repo.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/controller/delete_restriction_cubit/delete_restriction_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteRestrictionCubit extends Cubit<DeleteRestrictionState> {
  RestrictionRepo restrictionRepo;
  DeleteRestrictionCubit(this.restrictionRepo)
    : super(DeleteRestrictionInitial());

  Future<void> deleteRestriction({required int id}) async {
    emit(DeleteRestrictionLoading());
    var result = await restrictionRepo.deleteRestriction(id: id);
    result.fold(
      (failure) {
        emit(DeleteRestrictionFailure(failure.errorMessage));
      },
      (_) {
        emit(DeleteRestrictionSuccess());
      },
    );
  }
}
