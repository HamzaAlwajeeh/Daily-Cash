import 'package:daily_cash/Features/Restrictions/data/models/restriction/restriction.dart';
import 'package:daily_cash/Features/Restrictions/data/repos/restriction_repo.dart';
import 'package:daily_cash/core/errors/failuar.dart';
import 'package:dartz/dartz.dart';

class RestrictionRepoImpl implements RestrictionRepo {
  @override
  Future<Either<Failure, String>> addRestriction({
    required String date,
    required double amount,
    required String description,
    required int debitEntityId,
    required int creditEntityId,
  }) {
    // TODO: implement addRestriction
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Restriction>>> deleteRestriction({
    required int id,
  }) {
    // TODO: implement deleteRestriction
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> editRestriction({
    required String date,
    required double amount,
    required String description,
    required int debitEntityId,
    required int creditEntityId,
  }) {
    // TODO: implement editRestriction
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Restriction>>> getRestrictions() {
    // TODO: implement getRestrictions
    throw UnimplementedError();
  }
}
