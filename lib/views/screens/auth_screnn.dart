import 'package:book_recommendation/controllers/auth_provider.dart';
import 'package:book_recommendation/views/screens/sign_in_screen/sign_in_screnn.dart';
import 'package:book_recommendation/views/screens/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final screens = [SignInScreen(), SignUpScreen()];

  Widget build(BuildContext context) {
    return screens[Provider.of<AuthProvider>(context).currentScreenIndex];
  }
}
