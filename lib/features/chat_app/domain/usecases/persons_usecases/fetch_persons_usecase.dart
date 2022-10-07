import 'package:chat_app/error/failure.dart';
import 'package:chat_app/features/chat_app/domain/entities/person.dart';
import 'package:chat_app/features/chat_app/domain/repositories/fetch_data.dart';
import 'package:chat_app/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class FetchPersonsUsecase implements Usecase<Person, FetchPersonParams> {
  final FetchDataRepository fetchDataRepositiry;
  FetchPersonsUsecase({required this.fetchDataRepositiry});
  @override
  Future<Either<Failure, List<Person>>> call(params) {
    return fetchDataRepositiry.getPersons();
  }
}

class FetchPersonParams extends Equatable {
  @override
  List<Object?> get props => [];
}
