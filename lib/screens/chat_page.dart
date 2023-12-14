import 'package:chat_app/components/chat_bubble.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = 'ChatPage';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessagesCollection);
  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
   var email =  ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(KCreatedAt, descending: true).snapshots(),
        // future: messages.doc('Hb4Mwr1gRoLEknSq7M71').get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            // print(snapshot.data!.docs[0]['message']);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      kLogo,
                      height: 50,
                    ),
                    Text('Chat'),
                  ],
                ),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return messagesList[index].id == email ? ChatBubble(
                          message: messagesList[index],
                        ): ChatBubbleForFriend(message: messagesList[index]);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add({
                          KMessage: data,
                          KCreatedAt: DateTime.now(),
                          KId : email,
                        });
                        controller.clear();
                        _controller.animateTo(
                          0.0,
                          // _controller.position.maxScrollExtent,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 10),
                        );
                      },
                      decoration: InputDecoration(
                          hintText: 'Send Message',
                          suffixIcon: Icon(
                            Icons.send,
                            color: kPrimaryColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                              ))),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Text('Loading.......');
          }
          // print(snapshot.data!['message']);
        });
  }
}
