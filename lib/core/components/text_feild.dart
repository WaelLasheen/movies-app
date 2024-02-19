import 'package:flutter/material.dart';
import 'package:movies_app/core/provider/login_register_data.dart';
import 'package:provider/provider.dart';

class textFeild extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final String type;
  
  const textFeild({super.key, required this.hintText, required this.controller,this.obscureText=false, required this.type,});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Login_Register_Data>(context);

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

      onChanged: (v) {
          type=='name'? data.name=v : type=='email'? data.email=v : type=='password'? data.password=v : data.confirmPassword=v;
      },
    );
  }
}