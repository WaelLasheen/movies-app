import 'package:flutter/material.dart';
import 'package:movies_app/features/login/view/login.dart';
import 'package:movies_app/features/register/view/screen/register.dart';

class button extends StatelessWidget {
  final String text;
  final Color color;
  const button({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            fixedSize: const MaterialStatePropertyAll(Size.fromWidth(330)),
            backgroundColor: MaterialStatePropertyAll(color),
          ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                text == "Login" ? LogIn() : const Register(),
          ));
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            color: color == Colors.black ? Colors.white : Colors.black,
          ),
        ));
  }
}
