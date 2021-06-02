import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() { 
    super.initState();
    imageCache.clear();
  }
    bool _loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Mohammedamins App',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Cats and Dogs ML Identifier",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500, fontSize: 30),
              ),
              SizedBox(
                height: 50,
              ),
              Center(child: _loading ? Container(
                width: 350,
                child: Column(
                  children: [
                    Image.asset('Assets\2.1 cat_dog_icon.png'),
                    SizedBox(height: 50,),

                  ],
                ),
              ) : Container(),)
            ],
          ),
        ),
      ),
    );
  }
}
