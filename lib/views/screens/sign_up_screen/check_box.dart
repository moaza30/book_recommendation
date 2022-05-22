import 'package:flutter/material.dart';

import '../../../consts/color_manager.dart';

class CheckBoxStyle extends StatefulWidget {
  @override
  State<CheckBoxStyle> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBoxStyle> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, top: 10),
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
            'Please sign me up for the monthly newsletter',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
