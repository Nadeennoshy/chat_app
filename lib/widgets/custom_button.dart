import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.buttonName,required this.onPressed});
  final String buttonName;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        )
        
      ),
      onPressed: onPressed, 
      
      child: Text(buttonName,
      style: const TextStyle(
        color: kPrimaryColor,
      ),
      ),
      );
  }
}