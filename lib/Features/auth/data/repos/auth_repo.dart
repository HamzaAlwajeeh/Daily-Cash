import 'package:daily_cash/Features/auth/data/models/user_model.dart';
import 'package:daily_cash/core/errors/failuar.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, List<UserModel>>> login(String email, String password);
  Future<Either<Failure, List<UserModel>>> register(
    String userName,
    String email,
    String password,
  );
}
