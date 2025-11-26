import 'package:daily_cash/Features/Restrictions/data/models/restriction/restriction.dart';
import 'package:daily_cash/core/errors/failuar.dart';
import 'package:dartz/dartz.dart';

abstract class RestrictionRepo {
  Future<Either<Failure, List<Restriction>>> getRestrictions();

  Future<Either<Failure, String>> addRestriction({
    required String date,
    required double amount,
    required String description,
    required int debitEntityId,
    required int creditEntityId,
  });
  Future<Either<Failure, String>> editRestriction({
    required String date,
    required double amount,
    required String description,
    required int debitEntityId,
    required int creditEntityId,
  });

  Future<Either<Failure, List<Restriction>>> deleteRestriction({
    required int id,
  });
}
