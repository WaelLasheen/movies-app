import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        child: Image.asset('asset/images/logo.png')
      );
  }
}