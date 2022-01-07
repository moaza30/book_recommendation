import 'package:book_recommendation/controllers/auth_provider.dart';
import 'package:book_recommendation/screens/home_screen/main_screen.dart';
import 'package:book_recommendation/screens/sign_in_screen/check_box.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class SignInBody extends StatefulWidget {
  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  bool value = false;
  final TextEditingController email = TextEditingController(),
      password = TextEditingController();

  final GlobalKey<FormState> form = GlobalKey<FormState>();
  bool loggingIn = false, resettingPassword = false;

  void login() async {
    setState(() {
      loggingIn = true;
    });

    String? error = await Provider.of<AuthProvider>(context, listen: false)
        .login(email.text, password.text);

    if (error != null) {
      setState(() {
        loggingIn = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error)));
    }
  }

  void resetPassword() async {
    setState(() {
      resettingPassword = true;
    });
    String? error = await Provider.of<AuthProvider>(context, listen: false)
        .resetPassword(email.text);

    setState(() {
      resettingPassword = false;
    });
    if (error != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Reset password email has been sent.'),
        backgroundColor: Colors.green,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: form,
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20).add(
                EdgeInsets.only(top: 20),
              ),
              child: TextFormField(
                validator: (value) {
                  if (value != null &&
                      value.isNotEmpty &&
                      EmailValidator.validate(value)) {
                    return null;
                  } else {
                    return "Please enter valid email.";
                  }
                },
                controller: email,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  filled: true,
                  fillColor: Color.fromRGBO(239, 239, 239, 0.5),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                    color: Color.fromRGBO(33, 33, 33, 0.5),
                  ),
                  labelText: 'Enter Your Email',
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
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20).add(
                EdgeInsets.only(top: 20),
              ),
              child: TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value != null && value.length >= 6) {
                    return null;
                  } else {
                    return "Please enter 6 characters at least.";
                  }
                },
                controller: password,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  filled: true,
                  fillColor: Color.fromRGBO(239, 239, 239, 0.5),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                    color: Color.fromRGBO(33, 33, 33, 0.5),
                  ),
                  labelText: 'Enter your Password',
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
            ),
            // This Container For Sign Up CheckBox
            CheckBox_SignIn(),
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
                  if (form.currentState!.validate()) {
                    login();
                    Navigator.of(context)
                        .pushReplacementNamed(MainScreen.routeName);
                  }
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
            TextButton(
              style: TextButton.styleFrom(
                primary: Color.fromRGBO(90, 189, 140, 1),
              ),
              onPressed: () {
                resetPassword();
              },
              child: const Text('Forgot Password'),
            ),
          ],
        ),
      ),
    );
  }
}
