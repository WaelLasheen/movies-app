import 'package:flutter/material.dart';
import 'package:movies_app/features/login/view/login.dart';
import 'package:movies_app/features/register/view/screen/register.dart';

class move_between extends StatelessWidget {
  final String to;
  const move_between({super.key, required this.to});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(to == 'register' ? "Don't have an account? " : "Already have an account? ",
        style: const TextStyle(fontSize: 15),
        ),

        TextButton(
          style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.all(0.0))),
            onPressed: () {
              if (to == 'register') {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Register(),
                ));
              } else {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LogIn(),
                ));
              }
            },
            child: Text(
              to == 'register' ? "Register Now" : "Login Now",
              style: const TextStyle(color: Color(0xff35C2C1), fontSize: 15),
            ))
      ],
    );
  }
}
