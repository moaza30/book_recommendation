import 'package:flutter/material.dart';

class SigningDetails extends StatelessWidget {
  late String textdata;
  SigningDetails(this.textdata);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20).add(
            EdgeInsets.only(top: 20),
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(20),
              filled: true,
              fillColor: Color.fromRGBO(239, 239, 239, 0.5),
              labelStyle: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 15,
                color: Color.fromRGBO(33, 33, 33, 0.5),
              ),
              labelText: textdata,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(239, 239, 239, 0.5),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        )
      ],
    );
  }
}
