import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    bool _loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x004242),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'Mohammedamins App',
              style: TextStyle(color: Color(0x7D9E9E), fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Cats and Dogs ML Identifier",
              style: TextStyle(
                  color: Color(0X7D9E9E), fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 50,
            ),
            Center(child: _loading ? Container(
              width: 400,
              child: Column(
                children: [
                  Image.asset('assets\2.1 cat_dog_icon.png'),
                  SizedBox(height: 50,),

                ],
              ),
            ) : Container(),)
          ],
        ),
      ),
    );
  }
}
