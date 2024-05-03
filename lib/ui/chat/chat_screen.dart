import 'package:flutter/material.dart';

import '../../infrastructure/common/color_constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightBlack,
      body: const SafeArea(
        child: Center(
          child: Text("채팅",style: TextStyle(color: ColorConstants.whiteColor),),
        ),
      ),
    );
  }
}
