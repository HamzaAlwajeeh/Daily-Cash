import 'package:daily_cash/Features/Persons/data/models/person.dart';
import 'package:daily_cash/Features/Persons/data/repos/person_repo.dart';
import 'package:daily_cash/core/errors/failuar.dart';
import 'package:daily_cash/core/services/api_service.dart';
import 'package:daily_cash/core/services/shared_pref_singleton.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PersonRepoImpl implements PersonRepo {
  ApiService apiService;
  PersonRepoImpl(this.apiService);
  @override
  Future<Either<Failure, String>> addPerson({
    required String name,
    required String type,
  }) async {
    try {
      await apiService.post(
        endPoint: 'entities',
        body: {'name': name, 'type': type},
        token: Prefs.getString('token'),
      );
      return right('Person Added Successfully');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Person>>> getAllPersons() async {
    try {
      var data = await apiService.get(
        endPoint: 'entities',
        body: null,
        token: Prefs.getString('token'),
      );

      List<Person> persons = [];

      for (var personJson in data) {
        persons.add(Person.fromJson(personJson));
      }

      return Right(persons);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
