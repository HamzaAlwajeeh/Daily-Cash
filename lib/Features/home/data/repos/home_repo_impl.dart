// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daily_cash/Features/home/data/models/cash_box.dart';
import 'package:daily_cash/Features/home/data/models/operation.dart';
import 'package:daily_cash/Features/home/data/repos/home_repo.dart';
import 'package:daily_cash/core/errors/failuar.dart';
import 'package:daily_cash/core/services/api_service.dart';
import 'package:daily_cash/core/services/shared_pref_singleton.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, String>> addOperation({
    required String type,
    required String date,
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
          'entity_id': personId,
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
    required String date,
    required double amount,
    required String description,
    required int personId,
  }) async {
    try {
      await apiService.put(
        endPoint: 'revenues-expenses/$id',
        body: {
          'type': type,
          'date': date,
          'amount': amount,
          'description': description,
          'entity_id': personId,
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

  // revenues-expenses
  @override
  Future<Either<Failure, List<Operation>>> getAllOperations() async {
    try {
      var data = await apiService.get(
        endPoint: 'revenues-expenses',
        body: null,
        token: Prefs.getString('token'),
      );
      List<Operation> operations = [];

      for (var operationJson in data) {
        operations.add(Operation.fromJson(operationJson));
      }

      return right(operations);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Operation>>> getIncomeOperations() async {
    try {
      var data = await apiService.get(
        endPoint: 'get-incomes',
        body: null,
        token: Prefs.getString('token'),
      );
      List<Operation> operations = [];

      for (var operationJson in data) {
        operations.add(Operation.fromJson(operationJson));
      }

      return right(operations);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Operation>>> getOutcomeOperations() async {
    try {
      var data = await apiService.get(
        endPoint: 'get-expenses',
        body: null,
        token: Prefs.getString('token'),
      );
      List<Operation> operations = [];

      for (var operationJson in data) {
        operations.add(Operation.fromJson(operationJson));
      }

      return right(operations);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteOperation({required int id}) async {
    try {
      await apiService.delete(
        endPoint: 'revenues-expenses/$id',
        token: Prefs.getString('token'),
      );

      return right('Operation Deleted Successfully');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CashBox>> getCashBox() async {
    try {
      var data = await apiService.get(
        endPoint: 'cashbox',
        body: null,
        token: Prefs.getString('token'),
      );

      CashBox cashBox = CashBox.fromJson(data);

      return right(cashBox);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
