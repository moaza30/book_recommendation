import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final TextDecoration underLine;
  final FontWeight fontWeight;
  TextUtils({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.textColor,
    required this.underLine,
    required this.fontWeight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decoration: underLine,
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
