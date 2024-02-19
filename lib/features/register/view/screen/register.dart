import 'package:flutter/material.dart';
import 'package:movies_app/core/move_between_login_register.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Text("Hello! Register to get started",
              style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold ,fontSize: 30),),
          
          
              move_between(to: 'login')
            ],
          ),
        ),
      ),
    );
  }
}