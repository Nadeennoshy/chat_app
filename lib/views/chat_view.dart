import 'package:chat_app/constants.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  static String chatViewId = 'chatView';

  @override
  Widget build(BuildContext context) {
      final Stream<QuerySnapshot> messages = FirebaseFirestore.instance.collection('messages').snapshots();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(kImage,height: 50,),
            const Text('Chat',
            style: TextStyle(
              color: Colors.white,
            ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: ()async{
            await FirebaseAuth.instance.signOut();
            Navigator.pushNamed(context, LogInView.loginId);
          },
           icon: const Icon(Icons.logout,color: Colors.white,)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: ((context, index) {
                return const ChatBubble();
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.send,color: kPrimaryColor,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}