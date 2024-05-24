import 'package:flutter/material.dart';

class ScolarChatText extends StatelessWidget {
  const ScolarChatText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Scolar Chat',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Pacifico',
          fontSize: 28,
        ),
        ),
      ],
    );
  }
}