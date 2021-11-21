import 'package:book_recommendation/screens/start_screen/start_screen_details.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  static const routename = 'StartScreen';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/test.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: StartScreenStyle(),
      ),
    );
  }
}
