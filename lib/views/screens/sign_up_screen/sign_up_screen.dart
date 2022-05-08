import 'package:book_recommendation/views/screens/sign_up_screen/screen_details.dart';
import 'package:book_recommendation/views/screens/start_screen/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/auth_provider.dart';

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
        leading: IconButton(
          onPressed: () {
            Provider.of<AuthProvider>(context, listen: false).changeScreen();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(90, 189, 140, 1), //change your color here
        ),
      ),
      body: SignUpBody(),
    );
  }
}
