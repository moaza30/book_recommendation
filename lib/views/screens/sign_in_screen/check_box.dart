import 'package:flutter/material.dart';

import '../../../consts/color_manager.dart';

class CheckBox_SignIn extends StatefulWidget {
  @override
  State<CheckBox_SignIn> createState() => _CheckBox_SignInState();
}

class _CheckBox_SignInState extends State<CheckBox_SignIn> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10),
      child: Row(
        children: [
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              activeColor: ColorManager.mainColor,
              shape: const CircleBorder(),
              value: value,
              onChanged: (bool? value) {
                setState(() {
                  this.value = value!;
                });
              },
            ),
          ),
          const Text(
            'Stay Logged In ',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
