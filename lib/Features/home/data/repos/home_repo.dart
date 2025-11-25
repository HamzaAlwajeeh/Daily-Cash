import 'package:daily_cash/Features/home/data/models/operation.dart';
import 'package:daily_cash/core/errors/failuar.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Operation>>> getAllOperations();
  Future<Either<Failure, String>> addOperation({
    required String type,
    required String date,
    required double amount,
    required String description,
    required int personId,
  });
  Future<Either<Failure, String>> editOperation({
    required int id,
    required String type,
    required String date,
    required double amount,
    required String description,
    required int personId,
  });
  Future<Either<Failure, List<Operation>>> getIncomeOperations();
  Future<Either<Failure, List<Operation>>> getOutcomeOperations();
}
