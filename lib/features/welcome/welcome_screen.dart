import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: const Text('movitoo',style: TextStyle(color: Color(0xff35C2C1)),),
        ),

        body: const Center(
          child: Text("Welcome to MovitOo"),
        ),
      ),
    );
  }
}