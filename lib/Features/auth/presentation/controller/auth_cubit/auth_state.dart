part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SingUpLoading extends AuthState {}

final class SingUpFailure extends AuthState {
  final String errorMessage;

  SingUpFailure({required this.errorMessage});
}

final class SingUpSuccess extends AuthState {
  final User user;

  SingUpSuccess({required this.user});
}

final class LoginLoading extends AuthState {}

final class LoginFailure extends AuthState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}

final class LoginSuccess extends AuthState {
  final User user;

  LoginSuccess({required this.user});
}
