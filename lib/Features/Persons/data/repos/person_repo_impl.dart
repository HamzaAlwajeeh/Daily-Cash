import 'package:daily_cash/Features/Persons/data/models/person.dart';
import 'package:daily_cash/Features/Persons/data/repos/person_repo.dart';
import 'package:daily_cash/core/errors/failuar.dart';
import 'package:dartz/dartz.dart';

class PersonRepoImpl implements PersonRepo {
  @override
  Future<Either<Failure, String>> addPerson({
    required String name,
    required String type,
  }) {
    // TODO: implement addPerson
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Person>> getAllPersons() {
    // TODO: implement getAllPersons
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Person>> searchPerson({required String query}) {
    // TODO: implement searchPerson
    throw UnimplementedError();
  }
}
