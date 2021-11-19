import 'package:book_recommendation/screens/sign_in_screen/sign_in_screnn.dart';
import 'package:book_recommendation/screens/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';

class StartScreenStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.20),
            child: Text(
              'Books For \n      Every Taste',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 36,
                color: Color.fromRGBO(90, 189, 140, 1),
              ),
            ),
          ),

          //Container For Sign In Button
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20).add(
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(90, 189, 140, 1),
                minimumSize: Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(SignInScreen.routename);
              },
              child: Text(
                'Sign in',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),

          //Container For Sign Uo Button
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20).add(
              EdgeInsets.only(top: 20),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(90, 189, 140, 1),
                minimumSize: Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(SignUpScreen.routename);
              },
              child: Text(
                'Sign up',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),

          //Container For Skip Button
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.22, right: 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Skip ',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(90, 189, 140, 1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
