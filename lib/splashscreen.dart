import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: Home(),
      title: Text('Cat or Dog ML Classifier', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Color(0X00FFFF),),),
    );
  }
}