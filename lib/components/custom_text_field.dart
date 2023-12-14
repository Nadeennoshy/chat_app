import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({this.hintText,this.obsecureText = false, this.onChanged});

  String? hintText;
  bool? obsecureText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required';
        }
        // if (data != 'nadeen') {
        //   return 'value is wrong';
        // }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
