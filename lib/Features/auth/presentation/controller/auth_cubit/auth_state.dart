import 'package:daily_cash/Features/auth/data/models/user.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class SingUpLoading extends AuthState {}

final class SingUpFailure extends AuthState {
  final String errorMessage;

  SingUpFailure({required this.errorMessage});
}

final class SingUpSuccess extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginFailure extends AuthState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}

final class LoginSuccess extends AuthState {
  final User user;

  LoginSuccess({required this.user});
}

final class LogoutLoading extends AuthState {}

final class LogoutFailure extends AuthState {
  final String errorMessage;

  LogoutFailure({required this.errorMessage});
}

final class LogoutSuccess extends AuthState {}
