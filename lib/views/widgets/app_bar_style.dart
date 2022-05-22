import 'package:book_recommendation/consts/color_manager.dart';
import 'package:flutter/material.dart';

class AppBarStyle extends StatelessWidget {
  String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.whiteColor,
      elevation: 0.0,
      iconTheme: const IconThemeData(
          color: ColorManager.mainColor //change your color here
          ),
      title: Text(
        title!,
        style: const TextStyle(color: ColorManager.blackColor),
      ),
      centerTitle: true,
    );
  }
}
