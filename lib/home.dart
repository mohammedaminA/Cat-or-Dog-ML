import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  File _image;
  List _output;
  final picker = ImagePicker();

  @override
  void initState() { 
    super.initState();
    loadModel().then((value) {
      setState(() {
              
            });
    });
  }

  detectImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.6,
        imageMean: 127.5,
        imageStd: 127.5);
    setState(() {
          _output = output;
          _loading = false;
        });
  }

  loadModel() async {
    await Tflite.loadModel(model: 'images/model_unquant.tflite', labels: 'images/labels.txt');
  }

  @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
    }

    pickImage() async {
      var image = await picker.getImage(source: ImageSource.camera);
      if (image == null) return null;
      setState(() {
              _image = File(image.path);
            });

      detectImage(_image);
    }

     pickGalleryImage() async {
      var image = await picker.getImage(source: ImageSource.gallery);
      if (image == null) return null;
      setState(() {
              _image = File(image.path);
            });

      detectImage(_image);
    }

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
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: _loading
                    ? Container(
                        width: 350,
                        child: Column(
                          children: [
                            Image.network(
                                'https://i.ibb.co/YXqsvSQ/2-1-cat-dog-icon.png'),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      )
                    : Container(
                      child: Column(
                        children: [
                          Container(
                            height: 250,
                            child: Image.file(_image),
                          ),
                          SizedBox(height: 20,),
                          _output != null ? Text('${_output[0]['label']}', style: TextStyle(color: Colors.white, fontSize: 15)) : Container(),
                          SizedBox(height: 10,)
                        ],
                        
                      ),
                    ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        pickImage();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 250,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(6.0)),
                        child: Text(
                          'Capture Image using Camera',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        pickGalleryImage();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 250,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(6.0)),
                        child: Text(
                          'Pick Image from Gallery',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
