import 'package:flutter/material.dart';

class CheckBoxStyle extends StatefulWidget {
  @override
  State<CheckBoxStyle> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBoxStyle> {
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
              activeColor: Color.fromRGBO(90, 189, 140, 1),
              shape: CircleBorder(),
              value: this.value,
              onChanged: (bool? value) {
                setState(() {
                  this.value = value!;
                });
              },
            ),
          ),
          Text(
            'Please sign me up for the monthly newsletter',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
