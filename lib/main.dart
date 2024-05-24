import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/views/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LogInView.loginId :(context) => const LogInView(),
        RegisterView.registerId: (context)=> const RegisterView(),
        ChatView.chatViewId:(context) => const ChatView(),
      },
      initialRoute: LogInView.loginId,
    );
  }
}