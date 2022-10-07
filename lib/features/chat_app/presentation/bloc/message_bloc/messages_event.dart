part of 'messages_bloc.dart';

abstract class MessagesEvent extends Equatable {
  const MessagesEvent();

  @override
  List<Object> get props => [];
}

class PostMessageEvent extends MessagesEvent {
  final MessageEntity message;
  final String key;
  const PostMessageEvent({required this.message, required this.key});

  @override
  List<Object> get props => [message, key];
}

class GetMessagesEvent extends MessagesEvent {
  final String key;
  const GetMessagesEvent({required this.key});
  @override
  List<Object> get props => [key];
}
