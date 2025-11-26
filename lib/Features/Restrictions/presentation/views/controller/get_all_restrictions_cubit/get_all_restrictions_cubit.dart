// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_cash/Features/Restrictions/data/repos/restriction_repo.dart';
import 'package:daily_cash/Features/Restrictions/presentation/views/controller/get_all_restrictions_cubit/get_all_restrictions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllRestrictionsCubit extends Cubit<GetAllRestrictionsState> {
  RestrictionRepo restrictionRepo;
  GetAllRestrictionsCubit(this.restrictionRepo)
    : super(GetAllRestrictionsInitial());

  Future<void> getAllRestrictions() async {
    emit(GetAllRestrictionsLoading());
    var result = await restrictionRepo.getAllRestrictions();
    result.fold(
      (failure) {
        emit(GetAllRestrictionsFailure(failure.errorMessage));
      },
      (restrictions) {
        emit(GetAllRestrictionsSuccess(restrictions));
      },
    );
  }
}
