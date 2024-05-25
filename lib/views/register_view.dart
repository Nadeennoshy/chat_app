import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_form_field.dart';
import 'package:chat_app/widgets/navigate_text.dart';
import 'package:chat_app/widgets/register_text.dart';
import 'package:chat_app/widgets/scholar_chat_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  static String registerId = 'register';
  String? emailAddress;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            const SizedBox(height: 50,),
            Image.asset(kImage,height: 150,),
            const ScolarChatText(),
            const SizedBox(height: 60,),
            const RegisterText(registerText: 'Sign Up'),
            const SizedBox(height: 10,),
            CustomTextFormField(
              onChanged: (data){
                emailAddress = data;
              },
              hintText: 'Email'),
            const SizedBox(height: 10,),
            CustomTextFormField(
              onChanged: (data){
                password = data;
              },
              hintText: 'Password'),
            const SizedBox(height: 30,),
            CustomButton(
              onPressed: () async{
                 try {
              await createNewAccount();
              showSnackBar(context, 'Success');
              Navigator.pushNamed(context, ChatView.chatViewId);
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                showSnackBar(context, 'The password provided is too weak.');
              } else if (e.code == 'email-already-in-use') {
                showSnackBar(context, 'The account already exists for that email.');
              }
            } catch (e) {
              showSnackBar(context, e.toString());
            }
  },
              buttonName: 'Sign Up',),
            const SizedBox(height: 10,),
            NavigateText(
              haveAccount: 'Already have an account? ', 
              navigateText: 'Sign In', 
              onTap: (){
                Navigator.pushNamed(context, LogInView.loginId);
              })
          ],
        
            ),
      ),
    );
  }

  Future<void> createNewAccount() async {
     UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress!,
      password: password!,
    );
  }

}

