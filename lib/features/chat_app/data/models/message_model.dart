import 'package:chat_app/features/chat_app/domain/entities/message.dart';

class MessageModel extends MessageEntity {
  const MessageModel(
      {required String modelMessage,
      required String modelCreatedTime,
      required int modelUserId,
      required int modelRecipientId})
      : super(
            message: modelMessage,
            createdTime: modelCreatedTime,
            userId: modelUserId,
            recipientId: modelRecipientId);
            
}
