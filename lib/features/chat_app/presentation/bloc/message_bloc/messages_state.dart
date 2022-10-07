part of 'messages_bloc.dart';

abstract class MessagesState extends Equatable {
  const MessagesState();

  @override
  List<Object> get props => [];
}

class MessagesInitial extends MessagesState {
  @override
  List<Object> get props => [];
}

class LoadedMessagesState extends MessagesState {
  final List<MessageEntity> messageList;
  const LoadedMessagesState({required this.messageList});
  @override
  List<Object> get props => [messageList];
}

class ErrorState extends MessagesState {
  final String message;
  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
