import 'package:book_recommendation/views/screens/sign_in_screen/screen_details.dart';
import 'package:book_recommendation/views/screens/start_screen/start_screen.dart';
import 'package:flutter/material.dart';

import '../../../consts/color_manager.dart';

class SignInScreen extends StatefulWidget {
  static const String routename = 'SignIn';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorManager.whiteColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: ColorManager.mainColor, //change your color here
        ),
      ),
      body: SignInBody(),
    );
  }
}
