import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({super.key,required this.message});
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
              height: 70,
              width: 220,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )
              ),
              child: Text(message.message,
              style: const TextStyle(
                color: Colors.white,
              ),),
            ),
    );
  }
}