import 'package:book_recommendation/screens/sign_up_screen/sign_up_screen.dart';
import 'package:book_recommendation/screens/start_screen/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: StartScreen(),
      routes: {
        SignUpScreen.routename: (context) => SignUpScreen(),
        StartScreen.routename: (context) => StartScreen(),
      },
    );
  }
}
