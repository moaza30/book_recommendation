import 'package:book_recommendation/views/screens/home_screen/main_screen.dart';
import 'package:book_recommendation/views/screens/sign_up_screen/check_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_recommendation/controllers/auth_provider.dart';
import 'package:email_validator/email_validator.dart';

class SignUpBody extends StatefulWidget {
  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final TextEditingController email = TextEditingController(),
      username = TextEditingController(),
      password = TextEditingController();
  bool isRegistering = false;

  final GlobalKey<FormState> form = GlobalKey<FormState>();

  bool hidePassword = true;

  void createAccount() async {
    setState(() {
      isRegistering = true;
    });
    String? error = await Provider.of<AuthProvider>(context, listen: false)
        .createAccount(email.text, password.text, username.text);
    if (error != null) {
      setState(() {
        isRegistering = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return isRegistering
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
                      'Sign Up',
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
                      controller: username,
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          return null;
                        } else {
                          return "Please enter your name";
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20),
                        filled: true,
                        fillColor: const Color.fromRGBO(239, 239, 239, 0.5),
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Color.fromRGBO(33, 33, 33, 0.5),
                        ),
                        labelText: 'First Name & Last Name',
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
                      controller: password,
                      validator: (value) {
                        if (value != null && value.trim().length >= 6) {
                          return null;
                        } else {
                          return "Please enter 6 characters at least.";
                        }
                      },
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          child: Icon(
                            hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(20),
                        filled: true,
                        fillColor: const Color.fromRGBO(239, 239, 239, 0.5),
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Color.fromRGBO(33, 33, 33, 0.5),
                        ),
                        labelText: 'Enter your password',
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
                      validator: (value) {
                        if (value != null && value.trim().length >= 6) {
                          return null;
                        } else {
                          return "Password Doesn't match";
                        }
                      },
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20),
                        filled: true,
                        fillColor: const Color.fromRGBO(239, 239, 239, 0.5),
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Color.fromRGBO(33, 33, 33, 0.5),
                        ),
                        labelText: 'Repeat password',
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
                  CheckBoxStyle(),

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
                          createAccount();
                        }
                      },
                      child: const Text(
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
            ),
          );
  }
}
