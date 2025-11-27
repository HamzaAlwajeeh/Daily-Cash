import 'package:daily_cash/Features/Persons/data/models/person.dart';
import 'package:daily_cash/core/errors/failuar.dart';
import 'package:dartz/dartz.dart';

abstract class PersonRepo {
  Future<Either<Failure, String>> addPerson({
    required String name,
    required String type,
  });
  Future<Either<Failure, List<Person>>> getAllPersons();
  Future<Either<Failure, String>> deletePerson({required int id});
}
