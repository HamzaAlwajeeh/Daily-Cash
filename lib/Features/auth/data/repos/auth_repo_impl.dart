import 'package:daily_cash/Features/auth/data/models/user_model.dart';
import 'package:daily_cash/Features/auth/data/repos/auth_repo.dart';
import 'package:daily_cash/core/errors/failuar.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, List<UserModel>>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<UserModel>>> register(String userName, String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}