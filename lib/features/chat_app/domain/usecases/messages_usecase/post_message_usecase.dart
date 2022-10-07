import 'package:chat_app/error/failure.dart';
import 'package:chat_app/features/chat_app/domain/entities/message.dart';
import 'package:chat_app/features/chat_app/domain/repositories/messages_repository.dart';
import 'package:chat_app/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class PostMessageUsecase implements Usecase<MessageEntity, PostMessageParam> {
  final MessagesRepository messagesRepository;
  const PostMessageUsecase({required this.messagesRepository});
  @override
  Future<Either<Failure, dynamic>> call(params) async {
    return await messagesRepository.postMessage(
        message: params.message, key: params.key);
  }
}

class PostMessageParam extends Equatable {
  final MessageEntity message;
  final String key;
  const PostMessageParam({required this.message, required this.key});

  @override
  List<Object?> get props => [message, key];
}
