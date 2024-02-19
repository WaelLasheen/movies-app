import 'package:flutter/material.dart';
import 'package:movies_app/core/provider/login_register_data.dart';
import 'package:provider/provider.dart';

class LoginAndRegister extends StatelessWidget {
  final String text;
  const LoginAndRegister({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: const ButtonStyle(
          fixedSize: MaterialStatePropertyAll(Size.fromWidth(330)),
          backgroundColor: MaterialStatePropertyAll(Colors.black),
        ),
        onPressed: () {
          final data = Provider.of<Login_Register_Data>(context ,listen: false);
          if(text=="Login"){
            // replace with search operation in database
            print(data.email);
            print(data.password);
          }
          else{
            // replace with insert operation in database
            print(data.name);
            print(data.email);
            print(data.password);
            print(data.confirmPassword);
          }
        },
        child: Text( text,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ));
  }
}
