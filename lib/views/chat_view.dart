import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  static String chatViewId = 'chatView';
  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();
  
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    CollectionReference messages = FirebaseFirestore.instance.collection(kMessageCollection);
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt,descending: true).snapshots(), 
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasData){
          List<MessageModel> messagesList = [];
          for(int i=0;i<snapshot.data!.docs.length;i++){
            messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
          }
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
              reverse: true,
              controller:_controller,
              itemCount: messagesList.length,
              itemBuilder: ((context, index) {
                return ChatBubble(message: messagesList[index],);
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controller,
              onSubmitted: (data){
                messages.add({
                  kMessage: data,
                  kCreatedAt: DateTime.now(),
                  kId : email,
                });
                controller.clear();
                _controller.animateTo(
                0.0, 
                duration: const Duration(microseconds: 500), 
                curve: Curves.easeOut);
              },
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
      }else{
        return Text('Loading.......................');
      }
  });
    
    
  }
}