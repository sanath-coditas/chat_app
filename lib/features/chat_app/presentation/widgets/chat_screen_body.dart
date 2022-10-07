import 'package:chat_app/constants/color_constants.dart';
import 'package:chat_app/constants/current_user_details.dart';
import 'package:chat_app/features/chat_app/domain/entities/message.dart';
import 'package:chat_app/features/chat_app/domain/entities/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/container_style_constants.dart';
import 'dart:math';

import '../bloc/message_bloc/messages_bloc.dart';

class ChatScreenBody extends StatelessWidget {
  final Person user;
  ChatScreenBody({
    Key? key,
    required this.user,
  }) : super(key: key);

  final TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(child: BlocBuilder<MessagesBloc, MessagesState>(
        builder: (context, state) {
          if (state is MessagesInitial) {}
          if (state is LoadedMessagesState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                {
                  return Align(
                    alignment:
                        (currentUserId == state.messageList[index].userId)
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:
                            (currentUserId == state.messageList[index].userId)
                                ? kcustomColor[100]
                                : Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(state.messageList[index].message),
                      ),
                    ),
                  );
                }
              },
              itemCount: state.messageList.length,
            );
          }
          if (state is ErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: Placeholder(),
            );
          }
        },
      )),
      Padding(
        padding: const EdgeInsets.only(bottom: 24.0, left: 16, right: 16),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.emoji_emotions),
                    hintText: 'Type message.....',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              decoration: kiconBoxDecoration,
              child: IconButton(
                padding: const EdgeInsets.all(18),
                onPressed: () async {
                  if (messageController.text.isNotEmpty) {
                    BlocProvider.of<MessagesBloc>(context).add(PostMessageEvent(
                        message: MessageEntity(
                            createdTime: DateTime.now().toString(),
                            message: messageController.text,
                            recipientId: user.id,
                            userId: currentUserId),
                        key: (max(currentUserId, user.id) << 32).toString()));
                    messageController.clear();
                  }
                },
                icon: const Icon(
                  Icons.send,
                  color: kappThemeColor,
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
