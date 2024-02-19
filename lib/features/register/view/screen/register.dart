import 'package:flutter/material.dart';
import 'package:movies_app/core/components/login_register_button.dart';
import 'package:movies_app/core/components/move_between_login_register.dart';
import 'package:movies_app/core/components/text_feild.dart';
import 'package:movies_app/features/register/view/components/openning_text.dart';

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
                const OpenningText(),
                const Spacer(flex: 4,),
                textFeild(hintText: 'Name', controller: nameControler, type: 'name',),
                const SizedBox(height: 20,),
                textFeild(hintText: 'Email', controller: emailControler, type: 'email',),
                const SizedBox(height: 20,),
                textFeild(hintText: 'Password', controller: passwordControler, type: 'password',),
                const SizedBox(height: 20,),
                textFeild(hintText: 'Confirm Password', controller: confirmPasswordControler, type: 'confirmpassword',),
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