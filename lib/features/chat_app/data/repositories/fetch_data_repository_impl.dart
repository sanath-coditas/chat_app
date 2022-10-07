import 'package:chat_app/features/chat_app/data/datasources/remote_data_sources/http_data_source.dart';
import 'package:chat_app/features/chat_app/domain/entities/person.dart';
import 'package:chat_app/error/failure.dart';
import 'package:chat_app/features/chat_app/domain/repositories/fetch_data.dart';
import 'package:dartz/dartz.dart';

class FetchDataRepositoryImpl implements FetchDataRepository {
  final HttpDataSource httpDataSource;
  const FetchDataRepositoryImpl({required this.httpDataSource});
  @override
  Future<Either<Failure, List<Person>>> getPersons() async {
    return httpDataSource.getPersons();
  }
}
