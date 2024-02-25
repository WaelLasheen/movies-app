import 'package:flutter/material.dart';
import 'package:movies_app/core/database/database_helper.dart';
import 'package:movies_app/core/database/model.dart';
import 'package:movies_app/core/provider/login_register_data.dart';
import 'package:movies_app/features/home/view/Home.dart';
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
        onPressed: () async{
          final data = Provider.of<Login_Register_Data>(context ,listen: false);
          if(text=="Login"){
            if(existing(await Login_Register_Helper.instance.getUsers(), data.email, data.password)){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home(),));
            }
            else{
              print("/////////////////////////////");
              print("User do not exisit");
              print("/////////////////////////////");
            }
          }
          else{
            if(data.password==data.confirmPassword) {
              Login_Register_Helper.instance.insertUser(Login_Register(name: data.name, email: data.email, password: data.password));
              for(Login_Register i in await Login_Register_Helper.instance.getUsers()){
                print(i.name);
                print(i.email);
                print(i.password);
                print('///////////////////////////////////');
              }

              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home(),));
            }
            else{
//////////////////////////////// add it in snackbar
              print("Error in password");
            }
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

bool existing(List<Login_Register>users ,String email ,String password){
  for (var user in users) {
    if(user.email==email && user.password==password){
      return true;
    }
  }

  return false;
}
