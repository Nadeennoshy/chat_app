import 'package:flutter/material.dart';

class RegisterText extends StatelessWidget {
  const RegisterText({
    super.key,
    required this.registerText,
  });
  final String registerText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(registerText,
        style: const TextStyle(
          color: Colors.white,
        ),
        ),
      ],
    );
  }
}



