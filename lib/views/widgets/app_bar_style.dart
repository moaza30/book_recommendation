import 'package:flutter/material.dart';

class AppBarStyle extends StatelessWidget {
  String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      iconTheme: const IconThemeData(
        color: Color.fromRGBO(90, 189, 140, 1), //change your color here
      ),
      title: Text(
        title!,
        style: const TextStyle(color: Colors.black),
      ),
      centerTitle: true,
    );
  }
}
