import 'package:flutter/material.dart';
import 'splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat or Dog Identifier ML',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: MySplash(),
      debugShowCheckedModeBanner: false,
    );
  }
}

