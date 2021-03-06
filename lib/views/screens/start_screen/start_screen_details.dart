import 'package:book_recommendation/views/screens/sign_in_screen/sign_in_screnn.dart';
import 'package:book_recommendation/views/screens/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import '../../../consts/color_manager.dart';

class StartScreenStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.20),
          child: const Text(
            'Books For\n  Every Taste',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 36,
              color: ColorManager.mainColor,
            ),
          ),
        ),

        //Container For Sign In Button
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20).add(
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: ColorManager.mainColor,
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(SignInScreen.routename);
            },
            child: const Text(
              'Sign in',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),

        //Container For Sign Uo Button
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20).add(
            const EdgeInsets.only(top: 20),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: ColorManager.mainColor,
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(SignUpScreen.routename);
            },
            child: const Text(
              'Sign up',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
