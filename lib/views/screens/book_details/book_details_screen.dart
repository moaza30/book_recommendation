import 'package:book_recommendation/controllers/books_provider.dart';
import 'package:book_recommendation/models/books_api_manager.dart';
import 'package:book_recommendation/views/widgets/home_screen_widget/home_screen.dart';
import 'package:book_recommendation/views/widgets/home_screen_widget/list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BooksDetails extends StatelessWidget {
  static const String routename = 'BooksDetails';
// late Books books;

  @override
  Widget build(BuildContext context) {
    //  books = ModalRoute.of(context)!.settings.arguments as Books;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(90, 189, 140, 1), //change your color here
        ),
        title: const Text(
          'Book Details',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 10),
              child: Image.asset(
                'assets/images/Rectangle 307.png',
              ),
            ),
            Text(
              'ssss',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                'Published: 2020-08-04',
                style: TextStyle(color: Color(0xFFACB1B6), fontSize: 15),
              ),
            ),
            Row(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      primary: const Color.fromRGBO(90, 189, 140, 1),
                      side: const BorderSide(
                        color: Color.fromRGBO(90, 189, 140, 1),
                        width: 1.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, top: 15),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15).add(
                      const EdgeInsets.only(right: 20),
                    ),
                    child: Text(
                      'iousyhdiysaytdyiashoudhuiyasgtdyugfsayudgyuasgyufdasdukolashduiasgyudauksihduyiasuytdg',
                      style: TextStyle(fontSize: 16, color: Color(0xFF6D727A)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Books's Author",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Paulo Coelho",
                    style: TextStyle(fontSize: 16, color: Color(0xFF6D727A)),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Other Suggestions',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
