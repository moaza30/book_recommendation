import 'package:book_recommendation/widgets/Signing_screen_details.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInBody extends StatefulWidget {
  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  bool value = false;
  void userSignUp() {}

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
              'Sign In',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ),
          // Sign Up Details
          SigningDetails('Email Address'),
          SigningDetails('Password'),
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
                  'Stay Logged In ',
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
              //-----------
              onPressed: () {
                userSignUp();
              },
              child: Text(
                'Sign In',
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
