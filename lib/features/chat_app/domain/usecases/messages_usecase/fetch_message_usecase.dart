import 'package:chat_app/error/failure.dart';
import 'package:chat_app/features/chat_app/domain/entities/message.dart';
import 'package:chat_app/features/chat_app/domain/repositories/messages_repository.dart';
import 'package:chat_app/usecase.dart';
import 'package:dartz/dartz.dart';

class FetchMessageUsecase
    implements Usecase<MessageEntity, FetchMessagesParams> {
  final MessagesRepository messagesRepository;
  const FetchMessageUsecase({required this.messagesRepository});

  @override
  Future<Either<Failure, dynamic>> call(params) async {
    return await messagesRepository.getMessages(params.key);
  }
}

class FetchMessagesParams {
  final String key;
  const FetchMessagesParams({required this.key});
}
