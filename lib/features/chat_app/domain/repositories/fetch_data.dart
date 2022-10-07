import 'package:chat_app/features/chat_app/domain/entities/person.dart';
import 'package:dartz/dartz.dart';
import '../../../../error/failure.dart';

abstract class FetchDataRepository {
  Future<Either<Failure, List<Person>>> getPersons();
}
