import 'package:flutter/material.dart';
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
          child: Column(
            children: [
              const Text("Welcome back! Glad to see you, Again!",
              style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold ,fontSize: 30),),
          
              const Spacer(flex: 4,),
          
              textFeild(hintText: 'Enter your email', controller: emailControler),
              const SizedBox(height: 20,),
              textFeild(hintText: 'Enter your password' ,obscureText: true, controller: passwardControler,),
              
              const Spacer(flex: 1),
              ///////////////////////////// modifai this and make custom
              ElevatedButton(
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size.fromWidth(330)),
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                ),
                onPressed: (){}, 
                child: const Text('Login',
                  style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,),
                )
              ),

              const SizedBox(height: 15,),
              const move_between(to: 'register'),
              const SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}