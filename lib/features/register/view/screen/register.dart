import 'package:flutter/material.dart';
import 'package:movies_app/core/login_register_button.dart';
import 'package:movies_app/core/move_between_login_register.dart';
import 'package:movies_app/core/text_feild.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final nameControler = TextEditingController();
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();
  final confirmPasswordControler = TextEditingController();

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
                const Text("Hello! Register to get started",
                style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold ,fontSize: 30),),

                const Spacer(flex: 4,),

                textFeild(hintText: 'Name', controller: nameControler),
                const SizedBox(height: 20,),
                textFeild(hintText: 'Email', controller: emailControler),
                const SizedBox(height: 20,),
                textFeild(hintText: 'Password', controller: passwordControler),
                const SizedBox(height: 20,),
                textFeild(hintText: 'Confirm Password', controller: confirmPasswordControler),
                const SizedBox(height: 20,),
                const LoginAndRegister(text: "Register"),
                const Spacer(flex: 1,),
                const move_between(to: 'login'),
                const SizedBox(height: 15,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}