// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_cash/Features/home/data/models/operation.dart';
import 'package:daily_cash/Features/home/data/repos/home_repo.dart';
import 'package:daily_cash/core/errors/failuar.dart';
import 'package:daily_cash/core/services/api_service.dart';
import 'package:daily_cash/core/services/shared_pref_singleton.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;
  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, String>> addOperation({
    required String type,
    required DateTime date,
    required double amount,
    required String description,
    required int personId,
  }) async {
    try {
      await apiService.post(
        endPoint: 'revenues-expenses',
        body: {
          'type': type,
          'date': date,
          'amount': amount,
          'description': description,
          'person_id': personId,
        },
        token: Prefs.getString('token'),
      );
      return right('Operation Added Successfully');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> editOperation({
    required int id,
    required String type,
    required DateTime date,
    required double amount,
    required String description,
    required int personId,
  }) async {
    try {
      await apiService.post(
        endPoint: 'revenues-expenses/$id/',
        body: {
          'type': type,
          'date': date,
          'amount': amount,
          'description': description,
          'person_id': personId,
        },
        token: Prefs.getString('token'),
      );
      return right('Operation Edited Successfully');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Operation>>> getAllOperations() {
    // TODO: implement getAllOperations
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Operation>>> getIncomeOperations() {
    // TODO: implement getIncomeOperations
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Operation>>> getOutcomeOperations() {
    // TODO: implement getOutcomeOperations
    throw UnimplementedError();
  }
}
