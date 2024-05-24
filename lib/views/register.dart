import 'package:chat_app/constants.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_form_field.dart';
import 'package:chat_app/widgets/navigate_text.dart';
import 'package:chat_app/widgets/register_text.dart';
import 'package:chat_app/widgets/scholar_chat_text.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String registerId = 'register';

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
            const CustomTextFormField(hintText: 'Email'),
            const SizedBox(height: 10,),
            const CustomTextFormField(hintText: 'Password'),
            const SizedBox(height: 30,),
            CustomButton(
              onPressed: (){
                Navigator.pushNamed(context, ChatView.chatViewId);
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
}