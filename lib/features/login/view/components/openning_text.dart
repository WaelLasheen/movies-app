import 'package:flutter/material.dart';

class OpenningText extends StatelessWidget {
  const OpenningText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Welcome back! Glad to see you, Again!",
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
}
