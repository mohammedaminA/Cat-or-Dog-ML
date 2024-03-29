import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'home.dart';

class MySplash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 15,
      navigateAfterSeconds: Home(),
      title: Text('Cat or Dog ML Classifier', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.yellowAccent,),),
      image: Image.network('https://i.ibb.co/YXqsvSQ/2-1-cat-dog-icon.png'),
      backgroundColor: Colors.blueAccent,
      photoSize: 60,
      loaderColor: Colors.redAccent,
    );
  }
}