import 'package:daily_cash/Features/auth/data/repos/auth_repo.dart';
import 'package:daily_cash/Features/auth/presentation/controller/auth_cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AuthCubit(this.authRepo) : super(AuthInitial());

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SingUpLoading());
    var result = await authRepo.register(
      name: name,
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(SingUpFailure(errorMessage: failure.errorMessage)),
      (user) => emit(SingUpSuccess(user: user)),
    );
  }
}
