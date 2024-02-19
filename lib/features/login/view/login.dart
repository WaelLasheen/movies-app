import 'package:flutter/material.dart';
import 'package:movies_app/core/login_register_button.dart';
import 'package:movies_app/core/move_between_login_register.dart';
import 'package:movies_app/core/text_feild.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});

  final emailControler = TextEditingController();
  final passwardControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                const Text("Welcome back! Glad to see you, Again!",
                style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold ,fontSize: 30),),
                
                const Spacer(flex: 4,),
                textFeild(hintText: 'Enter your email', controller: emailControler),
                const SizedBox(height: 20,),
                textFeild(hintText: 'Enter your password' ,obscureText: true, controller: passwardControler,),
                const Spacer(flex: 1),
                const LoginAndRegister(text: "Login"),
                const SizedBox(height: 15,),
                const move_between(to: 'register'),
                const SizedBox(height: 15,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}