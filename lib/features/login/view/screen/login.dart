import 'package:flutter/material.dart';
import 'package:movies_app/core/components/login_register_button.dart';
import 'package:movies_app/core/components/move_between_login_register.dart';
import 'package:movies_app/core/components/text_feild.dart';
import 'package:movies_app/features/login/view/components/openning_text.dart';

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
                const OpenningText(),
                
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