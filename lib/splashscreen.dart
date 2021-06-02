import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'home.dart';

class MySplash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: Home(),
      title: Text('Cat or Dog ML Classifier', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Color(0X00FFFF),),),
      image: Image.network('https://www.pngitem.com/pimgs/m/106-1064361_cat-rabbit-and-dog-hd-png-download.png'),
      backgroundColor: Colors.blueAccent,
      photoSize: 60,
      loaderColor: Color(0X004242),
    );
  }
}