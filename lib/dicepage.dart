import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:shake/shake.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  late final ShakeDetector shakeDetector;
  @override
  void initState() {
    super.initState();
    shake();
  }

  int leftDiceNumber = Random().nextInt(6) + 1 ;
  int rightDiceNumber = Random().nextInt(6) + 1 ;
  
  void shake() {
    shakeDetector = ShakeDetector.autoStart(onPhoneShake: () {
      AudioCache()..play('shakedice.wav');
      diceNumber();
    })
      ..startListening();
    shakeDetector.startListening();

    debugPrint("Shake instance triggered");
  }

  @override
  void dispose() {
    super.dispose();
    shakeDetector.stopListening();
  }

  void diceNumber() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;

      jackpot();
    });
  }

  void jackpot() {
    if (leftDiceNumber & rightDiceNumber == 6) {
      toast();
      print('Jackpot Works');
      AudioCache()..play('congratulations.mp3');
    }
    // else if (leftDiceNumber == 6 || rightDiceNumber == 6){
    //   AudioCache()..play("congratulations.mp3");
    // }
  }

  void toast() {
    Fluttertoast.showToast(
        msg: "JackPot",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 20.0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blueAccent,
          appBar: AppBar(
            title: Center(
              child: Text(
                'Dicee',
                style: TextStyle(),
              ),
            ),
            backgroundColor: Colors.blueAccent,
          ),
          body: Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.audiotrack_rounded,
                    color: Colors.redAccent,
                    size: 35,
                  ),
                  Container(
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              // setState(() {
                              //   shake();
                              // });
                            },
                            child: Image.asset(
                              'images/dice$leftDiceNumber.png',
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                shake();
                              });
                            },
                            child: Image.asset(
                              'images/dice$rightDiceNumber.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       diceNumber();
                  //       AudioCache()..play('shakedice.wav');
                  //     });
                  //   },
                  //   child: Text('Roll Dice'),
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Colors.black,
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
