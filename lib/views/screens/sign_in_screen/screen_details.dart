import 'package:book_recommendation/controllers/auth_provider.dart';
import 'package:book_recommendation/views/screens/home_screen/main_screen.dart';
import 'package:book_recommendation/views/screens/sign_in_screen/check_box.dart';
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
  bool loggingIn = false, resettingPassword = false;

  final TextEditingController email = TextEditingController(),
      password = TextEditingController();

  final GlobalKey<FormState> form = GlobalKey<FormState>();

  Future<void> login() async {
    setState(() {
      loggingIn = true;
    });

    String? error = await Provider.of<AuthProvider>(context, listen: false)
        .login(email.text, password.text);

    if (error != null) {
      setState(() {
        loggingIn = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Reset password email has been sent.'),
          backgroundColor: Color.fromRGBO(90, 189, 140, 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return loggingIn || resettingPassword
        ? Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          )
        : SingleChildScrollView(
            child: Form(
              key: form,
              child: Column(
                children: [
                  //Start of Column
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Sign In',
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Sign Up Details
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20).add(
                      const EdgeInsets.only(top: 20),
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
                        contentPadding: const EdgeInsets.all(20),
                        filled: true,
                        fillColor: const Color.fromRGBO(239, 239, 239, 0.5),
                        labelStyle: const TextStyle(
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
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(239, 239, 239, 0.5),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20).add(
                      const EdgeInsets.only(top: 20),
                    ),
                    child: TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value != null && value.length >= 6) {
                          return null;
                        } else {
                          return "Please enter correct password";
                        }
                      },
                      controller: password,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20),
                        filled: true,
                        fillColor: const Color.fromRGBO(239, 239, 239, 0.5),
                        labelStyle: const TextStyle(
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
                          borderSide: const BorderSide(
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
                    margin: const EdgeInsets.symmetric(horizontal: 20).add(
                      const EdgeInsets.only(top: 15),
                    ),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: const Color.fromRGBO(90, 189, 140, 1),
                        side: const BorderSide(
                          color: Color.fromRGBO(90, 189, 140, 1),
                          width: 1.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(20),
                      ),
                      //-----------
                      onPressed: () {
                        if (form.currentState!.validate()) {
                          login();
                        }
                      },
                      child: const Text(
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
                      primary: const Color.fromRGBO(90, 189, 140, 1),
                    ),
                    onPressed: () {
                      Provider.of<AuthProvider>(context, listen: false)
                          .changeScreen();
                    },
                    child: const Text('Sign Up for free'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: const Color.fromRGBO(90, 189, 140, 1),
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
