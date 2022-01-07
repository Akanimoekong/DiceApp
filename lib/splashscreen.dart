import 'package:flutter/material.dart';
import 'package:newdice/dicepage.dart';
import 'package:splashscreen/splashscreen.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}
class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SplashScreen(
              seconds: 5,
              navigateAfterSeconds: new DicePage(),
              image: new Image.asset('images/diceapp.gif'),
              backgroundColor: Colors.black,
              photoSize: 100.0,
          ),
        ),
      ) ,
    );

  }
}
