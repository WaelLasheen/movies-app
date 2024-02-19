import 'package:flutter/material.dart';
import 'package:movies_app/core/database/database_helper.dart';
import 'package:movies_app/core/provider/login_register_data.dart';
import 'package:movies_app/features/onboarding/view/screen/onboarding_screen.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Login_Register_Helper.instance.open();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=> Login_Register_Data(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoardingScreen(),
      ),
    );
  }
}