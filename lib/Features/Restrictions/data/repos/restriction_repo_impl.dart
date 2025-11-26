import 'package:daily_cash/Features/Restrictions/data/models/restriction/restriction.dart';
import 'package:daily_cash/Features/Restrictions/data/repos/restriction_repo.dart';
import 'package:daily_cash/core/errors/failuar.dart';
import 'package:daily_cash/core/services/api_service.dart';
import 'package:daily_cash/core/services/shared_pref_singleton.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RestrictionRepoImpl implements RestrictionRepo {
  ApiService apiService;
  RestrictionRepoImpl(this.apiService);

  @override
  Future<Either<Failure, String>> addRestriction({
    required String date,
    required double amount,
    required String description,
    required int debitEntityId,
    required int creditEntityId,
  }) async {
    try {
      await apiService.post(
        endPoint: 'journal-entries',
        body: {
          'date': date,
          'amount': amount,
          'description': description,
          'debit_entity_id': debitEntityId,
          'credit_entity_id': creditEntityId,
        },
        token: Prefs.getString('token'),
      );
      return right('Restriction Added Successfully');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteRestriction({required int id}) async {
    try {
      await apiService.delete(
        endPoint: 'journal-entries/$id',
        token: Prefs.getString('token'),
      );
      return right('Restriction Deleted Successfully');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> editRestriction({
    required int id,
    required String date,
    required double amount,
    required String description,
    required int debitEntityId,
    required int creditEntityId,
  }) async {
    try {
      await apiService.put(
        endPoint: 'journal-entries/$id',
        body: {
          'date': date,
          'amount': amount,
          'description': description,
          'debit_entity_id': debitEntityId,
          'credit_entity_id': creditEntityId,
        },
        token: Prefs.getString('token'),
      );
      return right('Restriction Added Successfully');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Restriction>>> getAllRestrictions() async {
    try {
      var data = await apiService.get(
        endPoint: 'journal-entries',
        body: null,
        token: Prefs.getString('token'),
      );
      List<Restriction> restrictions = [];

      for (var restrictionJson in data) {
        restrictions.add(Restriction.fromJson(restrictionJson));
      }

      return right(restrictions);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
