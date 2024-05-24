import 'package:flutter/material.dart';

class NavigateText extends StatelessWidget {
  const NavigateText({
    super.key,
    required this.haveAccount,
    required this.navigateText,
    required this.onTap,
  });
  final String haveAccount;
  final String navigateText;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(haveAccount,
        style: const TextStyle(
          color: Colors.white,
        ),),
        GestureDetector(
          onTap: onTap,
          child: Text(navigateText,
          style: const TextStyle(
            color: Color(0xffC7EDE6),
          ),),
        )
      ],
    );
  }
}
