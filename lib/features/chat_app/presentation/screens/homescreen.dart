import 'dart:math';

import 'package:chat_app/constants/color_constants.dart';
import 'package:chat_app/constants/container_style_constants.dart';
import 'package:chat_app/constants/current_user_details.dart';
import 'package:chat_app/constants/text_constants.dart';
import 'package:chat_app/constants/text_style_constants.dart';
import 'package:chat_app/features/chat_app/presentation/screens/user_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/message_bloc/messages_bloc.dart';
import '../bloc/person_bloc/person_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: kwhiteColor,
        appBar: AppBar(
          backgroundColor: kwhiteColor,
          bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height / 15),
            child: const TabBar(
                indicatorColor: kappThemeColor,
                labelColor: kappThemeColor,
                unselectedLabelColor: kblackCOlor,
                tabs: [
                  Tab(
                    child: Text(TextConstants.kchatsText),
                  ),
                  Tab(
                    child: Text(TextConstants.kstatusText),
                  ),
                  Tab(
                    child: Text(TextConstants.kcallsText),
                  ),
                ]),
          ),
          elevation: 0,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 16, top: 5, bottom: 6),
              decoration: kiconBoxDecoration,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 25,
                  color: kappThemeColor,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 24, top: 5, bottom: 6),
              decoration: kiconBoxDecoration,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_outlined,
                  color: kappThemeColor,
                ),
              ),
            ),
          ],
          title: const Text(
            TextConstants.kappTitle,
            style: kappTitleStyle,
          ),
          centerTitle: false,
        ),
        body: BlocBuilder<PersonBloc, PersonState>(
          builder: (context, state) {
            return TabBarView(
              children: [
                (state is LoadedState)
                    ? ListView.builder(
                        itemCount: state.persons.length,
                        itemBuilder: ((context, index) {
                          if (state.persons[index].id == currentUserId) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => UserChatScreen(
                                            user: state.persons[index],
                                          )));

                                  BlocProvider.of<MessagesBloc>(context).add(
                                      GetMessagesEvent(
                                          key: (max(
                                                      currentUserId,
                                                      state
                                                          .persons[index].id) <<
                                                  32)
                                              .toString()));
                                },
                                title: Text(state.persons[index].name),
                                leading: CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      NetworkImage(state.persons[index].image),
                                )),
                          );
                        }),
                      )
                    : const Center(child: CircularProgressIndicator()),
                const Placeholder(),
                const Placeholder(),
              ],
            );
          },
        ),
      ),
    );
  }
}
