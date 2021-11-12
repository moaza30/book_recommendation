import 'package:book_recommendation/screens/sign_up_screen/sign_uo_details.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatefulWidget {
  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //Start of Column
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.topLeft,
            child: Text(
              'Sign Up',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ),
          // Sign Up Details
          SignUpDetails('First & Last Name'),
          SignUpDetails('Email'),
          SignUpDetails('Password'),
          SignUpDetails('Repeat Password'),

          // This Container For Sign Up CheckBox
          Container(
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
          ),
          // Container for The OutlinedButton
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20).add(
              EdgeInsets.only(top: 15),
            ),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Color.fromRGBO(90, 189, 140, 1),
                side: BorderSide(
                  color: Color.fromRGBO(90, 189, 140, 1),
                  width: 1.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(20),
              ),
              onPressed: () {},
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(90, 189, 140, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
