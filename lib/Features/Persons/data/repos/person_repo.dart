import 'package:daily_cash/Features/Persons/data/models/person.dart';
import 'package:daily_cash/core/errors/failuar.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> addPerson({
    required String name,
    required String type,
  });
  Future<Either<Failure, Person>> getAllPersons();
  Future<Either<Failure, Person>> searchPerson({required String query});
}
