import 'package:flutter/material.dart';
import 'package:newdice/splashscreen.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Splashscreen(),
    )
  );
}

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// import 'luckdice.dart';
//
// void main() {
//   return runApp(
//     MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.blue,
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text('Lucky Guess'),
//           backgroundColor: Colors.blue,
//         ),
//         body: const GuessPage(),
//       ),
//     ),
//   );
// }