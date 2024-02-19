import 'package:flutter/material.dart';

class LoginAndRegister extends StatelessWidget {
  final String text;
  const LoginAndRegister({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: const ButtonStyle(
          fixedSize: MaterialStatePropertyAll(Size.fromWidth(330)),
          backgroundColor: MaterialStatePropertyAll(Colors.black),
        ),
        onPressed: () {},
        child: Text( text,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ));
  }
}
