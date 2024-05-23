import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/scholar.png',),
            const Text('Scolar Chat',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Pacifico',
              fontSize: 28,
            ),
            ),
            const SizedBox(height: 60,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Sign In',
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            const CustomTextFormField(hintText: 'Email'),
            const SizedBox(height: 10,),
            const CustomTextFormField(hintText: 'Password',),
            const SizedBox(height: 30,),
            const CustomButton(),
            const SizedBox(height: 10,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('don\'t have an account? ',
                style: TextStyle(
                  color: Colors.white,
                ),),
                Text('Sign Up',
                style: TextStyle(
                  color: Color(0xffC7EDE6),
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}

