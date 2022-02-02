import 'package:book_recommendation/views/screens/sign_in_screen/screen_details.dart';
import 'package:book_recommendation/views/screens/start_screen/start_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  static const String routename = 'SignIn';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
      body: SignInBody(),
    );
  }
}
