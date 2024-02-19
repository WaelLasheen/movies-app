import 'package:flutter/material.dart';

class OpenningText extends StatelessWidget {
  const OpenningText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Hello! Register to get started",
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
}
