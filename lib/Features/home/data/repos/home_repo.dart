import 'package:daily_cash/core/errors/failuar.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, String>> addOperation({
    required String type,
    required DateTime date,
    required double amount,
    required String description,
    required String personId,
  });
  Future<Either<Failure, String>> getAllOperations();
  Future<Either<Failure, String>> addO({required double balance});
}
