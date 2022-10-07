import 'package:chat_app/constants/color_constants.dart';
import 'package:chat_app/constants/container_style_constants.dart';
import 'package:chat_app/constants/text_style_constants.dart';
import 'package:chat_app/features/chat_app/domain/entities/person.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_screen_body.dart';

class UserChatScreen extends StatelessWidget {
  final Person user;
  const UserChatScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhiteColor,
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(
              color: kblackCOlor,
            ),
          ),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: kwhiteColor,
        leading: IconButton(
          color: kappThemeColor,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8, top: 5, bottom: 6),
            decoration: kiconBoxDecoration,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.phone,
                size: 25,
                color: kappThemeColor,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 8, top: 5, bottom: 6),
            decoration: kiconBoxDecoration,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.video_call,
                color: kappThemeColor,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 8, top: 5, bottom: 6),
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(user.image),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 120,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  user.name,
                  style: kappTitleStyle,
                ),
              ),
            )
          ],
        ),
      ),
      body: ChatScreenBody(user: user),
    );
  }
}
