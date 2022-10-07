import 'package:bloc/bloc.dart';
import 'package:chat_app/features/chat_app/domain/entities/message.dart';
import 'package:chat_app/features/chat_app/domain/usecases/messages_usecase/fetch_message_usecase.dart';
import 'package:chat_app/features/chat_app/domain/usecases/messages_usecase/post_message_usecase.dart';
import 'package:equatable/equatable.dart';

part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  final PostMessageUsecase postMessageUsecase;
  final FetchMessageUsecase fetchMessageUsecase;

  MessagesBloc({
    required this.postMessageUsecase,
    required this.fetchMessageUsecase,
  }) : super(MessagesInitial()) {
    on<MessagesEvent>((event, emit) {});

    on<PostMessageEvent>((event, emit) async {
      // print('Inside......@@@@@');
      final getPostStatusEither = await postMessageUsecase(
          PostMessageParam(message: event.message, key: event.key));
      getPostStatusEither.fold((l) => emit(ErrorState(message: l.toString())),
          (r) {
        // print('Inside......');
        return emit(LoadedMessagesState(messageList: r));
      });
    });
    on<GetMessagesEvent>((event, emit) async {
      
      final getMessagesStatusEither =
          await fetchMessageUsecase(FetchMessagesParams(key: event.key));
      getMessagesStatusEither
          .fold((l) => emit(ErrorState(message: l.toString())), (r) {
        
        return emit(LoadedMessagesState(messageList: r));
      });
    });
  }
}
