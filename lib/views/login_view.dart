import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/register_view.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_form_field.dart';
import 'package:chat_app/widgets/navigate_text.dart';
import 'package:chat_app/widgets/register_text.dart';
import 'package:chat_app/widgets/scholar_chat_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LogInView extends StatefulWidget {
  LogInView({super.key});
  static String loginId = 'login';

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  String? emailAddress;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool inAsyncCall = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: inAsyncCall,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  kImage,
                  height: 150,
                ),
                const ScolarChatText(),
                const SizedBox(
                  height: 60,
                ),
                const RegisterText(
                  registerText: 'Sign In',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    onChanged: (data) {
                      emailAddress = data;
                    },
                    hintText: 'Email'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  obscureText: true,
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  buttonName: 'Sign In',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      inAsyncCall = true;
                      setState(() {
                        
                      });
                      try {
                        await loginMethod();
                        showSnackBar(context, 'Success');
                        Navigator.pushNamed(context, ChatView.chatViewId);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'invalid-credential') {
                          showSnackBar(context, 'Invalid user');
                        }
                      } catch (ex) {
                        showSnackBar(context, ex.toString());
                      }
                      inAsyncCall = false;
                      setState(() {
                        
                      });
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                NavigateText(
                  haveAccount: 'don\'t have an account? ',
                  navigateText: 'Sign Up',
                  onTap: () {
                    Navigator.pushNamed(context, RegisterView.registerId,arguments: emailAddress);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginMethod() async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress!, password: password!);
  }
}
