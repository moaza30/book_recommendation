import 'package:book_recommendation/screens/sign_up_screen/screen_details.dart';
import 'package:book_recommendation/screens/start_screen/start_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const String routename = 'SignUp';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(StartScreen.routename);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(90, 189, 140, 1),
          ),
        ),
      ),
      body: SignUpBody(),
    );
  }
}
