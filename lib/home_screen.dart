import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/test.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.20),
                child: Text(
                  'Books For \n      Every Taste',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 36,
                    color: Color.fromRGBO(90, 189, 140, 1),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20).add(
                  EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.15),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(90, 189, 140, 1),
                    minimumSize: Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20).add(
                  EdgeInsets.only(top: 20),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(90, 189, 140, 1),
                    minimumSize: Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Sign up',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
