import 'package:chat_app/components/custom_button.dart';
import 'package:chat_app/components/custom_text_field.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snackbar.dart';
import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/cubits/Login_cubit/login_cubit.dart';
import 'package:chat_app/screens/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  static String id = 'LoginPage';
  String? email;
  String? password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          Navigator.pushNamed(context, ChatPage.id);
        } else if (state is LoginFailure) {
          showSnackBar(context, 'Something went wrong');
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Image.asset(
                    'assets/images/scholar.png',
                    height: 100.0,
                    width: 100.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Scholar Chat',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'pacifico',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Sign In',
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
                    obsecureText: true,
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
                        
                      //   isLoading = true;
                      //   try {
                      //     await registerUser();
                      //     Navigator.pushNamed(context, ChatPage.id,
                      //         arguments: email);
                      //     // showSnackBar(context, 'Success');
                      //   } on FirebaseAuthException catch (ex) {
                      //     if (ex.code == 'user-not-found') {
                      //       showSnackBar(
                      //           context, 'No user found for that email');
                      //     } else if (ex.code == 'wrong-password') {
                      //       showSnackBar(context,
                      //           'wrong password provider for that user');
                      //     }
                      //   } catch (ex) {
                      //     print(ex);
                      //     showSnackBar(context, 'There was an error');
                      //   }
                      //   isLoading = false;
                      }
                    },
                    title: 'LOGIN',
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'don\'t have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterPage.id);
                        },
                        child: Text(
                          ' Register',
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
      ),
    );
  }

  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);
  }
}
