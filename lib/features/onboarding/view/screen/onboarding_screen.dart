import 'package:flutter/material.dart';
import 'package:movies_app/core/database/database_helper.dart';
import 'package:movies_app/core/database/model.dart';
import 'package:movies_app/features/onboarding/view/components/button.dart';
import 'package:movies_app/features/onboarding/view/components/logo.dart';
import 'package:movies_app/features/onboarding/view/components/quest.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width:  MediaQuery.sizeOf(context).width,
        height:  MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("asset/images/img.png"),fit: BoxFit.cover),
        ),
        child: FutureBuilder<List<Login_Register>>(
          future: Login_Register_Helper.instance.getUsers(),
          builder: (context, snapshot) {
            if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()),);
            }

            else if(snapshot.hasData){
              return const Column(
                children: <Widget>[
                  Spacer(),
                  Logo(),
                  SizedBox(height: 40,),
                  button(text: 'Login', color: Colors.black,),
                  SizedBox(height: 12,),
                  button(text: 'Register', color: Colors.white,),
                  SizedBox(height: 30,),
                  guest(),
                  SizedBox(height: 8,),
                ],
              );
            }

            return const Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}