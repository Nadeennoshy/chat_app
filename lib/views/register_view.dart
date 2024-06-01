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
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});
  static String registerId = 'register';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
                const RegisterText(registerText: 'Sign Up'),
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
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: 'Password'),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      inAsyncCall = true;
                      setState(() {});
                      try {
                        await createNewAccount();
                        showSnackBar(context, 'Success');
                        Navigator.pushNamed(context, ChatView.chatViewId,
                            arguments: emailAddress);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(
                              context, 'The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context,
                              'The account already exists for that email.');
                        }
                      } catch (e) {
                        showSnackBar(context, e.toString());
                      }
                      inAsyncCall = false;
                      setState(() {});
                    }
                  },
                  buttonName: 'Sign Up',
                ),
                const SizedBox(
                  height: 10,
                ),
                NavigateText(
                    haveAccount: 'Already have an account? ',
                    navigateText: 'Sign In',
                    onTap: () {
                      Navigator.pushNamed(context, LogInView.loginId);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> createNewAccount() async {
    UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress!,
      password: password!,
    );
  }
}
