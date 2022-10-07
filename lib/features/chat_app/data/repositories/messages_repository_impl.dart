import 'package:chat_app/features/chat_app/data/datasources/remote_data_sources/http_data_source.dart';
import 'package:chat_app/features/chat_app/domain/entities/message.dart';
import 'package:chat_app/error/failure.dart';
import 'package:chat_app/features/chat_app/domain/repositories/messages_repository.dart';
import 'package:dartz/dartz.dart';

class MessagesRepositoryImpl implements MessagesRepository {
  final HttpDataSource httpDataSource;
  const MessagesRepositoryImpl({required this.httpDataSource});
  @override
  Future<Either<Failure, List<MessageEntity>>> getMessages(String key) async {
    return await httpDataSource.getMessages(key);
  }

  @override
  Future<Either<Failure, List<MessageEntity>>> postMessage(
      {required MessageEntity message, required String key}) async {
    return await httpDataSource.postMessage(message, key);
  }
}
