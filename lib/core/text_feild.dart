import 'package:flutter/material.dart';

class textFeild extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  
  const textFeild({super.key, required this.hintText, required this.controller,this.obscureText=false,});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        helperStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: Colors.grey
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none
        ) ,
        filled: true,
        fillColor: Colors.grey[200]
      ),
    );
  }
}