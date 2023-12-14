import 'package:chat_app/components/custom_button.dart';
import 'package:chat_app/components/custom_text_field.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snackbar.dart';
import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? email;

  String? password;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 60.0,
                ),
                Image.asset(
                  'assets/images/scholar.png',
                  height: 100.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Scholar Chat',
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'pacifico'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.0,
                ),
                Row(
                  children: [
                    Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomTextFormField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomTextFormField(
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      try {
                        await registerUser();
                        // showSnackBar(context, 'Success');
                        Navigator.pushNamed(context, ChatPage.id, arguments: email);
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-password') {
                          showSnackBar(context, 'weak password');
                        } else if (ex.code == 'email-already-in-use') {
                          showSnackBar(context, 'email exists');
                        }
                      } catch (ex) {
                        showSnackBar(context, 'There was an error');
                      }
                      isloading = false;
                      setState(() {});
                    }

                    // try {
                    //   var auth = FirebaseAuth.instance;
                    //   UserCredential user =
                    //       await auth.createUserWithEmailAndPassword(
                    //           email: email!, password: password!);
                    // } catch (ex) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //       content: Text(ex.toString()),

                    //       // Text(
                    //       //   'There was an error, please try again',
                    //       // ),
                    //     ),
                    //   );
                    //   // print(ex);
                    // }
                  },
                  title: 'REGISTER',
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'already have an account?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        ' Login',
                        style: TextStyle(
                          color: Color.fromARGB(255, 217, 235, 232),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
