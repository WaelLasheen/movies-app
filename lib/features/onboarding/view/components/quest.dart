import 'package:flutter/material.dart';
import 'package:movies_app/features/welcome/welcome_screen.dart';

class guest extends StatelessWidget {
  const guest({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Welcome(),
          ));
        },
        child: const Text(
          "Continue as a guest",
          style: TextStyle(
              color: Color(0xff35C2C1),
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ));
  }
}
