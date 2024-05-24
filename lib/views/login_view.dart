import 'package:chat_app/constants.dart';
import 'package:chat_app/views/register.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_form_field.dart';
import 'package:chat_app/widgets/navigate_text.dart';
import 'package:chat_app/widgets/register_text.dart';
import 'package:chat_app/widgets/scholar_chat_text.dart';
import 'package:flutter/material.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});
  static String loginId = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(kImage,),
            const ScolarChatText(),
            const SizedBox(height: 60,),
            const RegisterText(registerText: 'Sign In',),
            const SizedBox(height: 10,),
            const CustomTextFormField(hintText: 'Email'),
            const SizedBox(height: 10,),
            const CustomTextFormField(hintText: 'Password',),
            const SizedBox(height: 30,),
            const CustomButton(buttonName: 'Sign In',),
            const SizedBox(height: 10,),
            NavigateText(
              haveAccount: 'don\'t have an account? ',
              navigateText: 'Sign Up',
              onTap: (){
                Navigator.pushNamed(context, RegisterView.registerId);
              },
            )
          ],
        ),
      ),
    );
  }
}