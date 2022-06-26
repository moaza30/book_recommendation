import 'package:book_recommendation/consts/color_manager.dart';
import 'package:book_recommendation/models/books_api_manager.dart';
import 'package:flutter/material.dart';
import 'google_content.dart';

class GoogleBooksDetails extends StatefulWidget {
  static const String routename = 'GoogleBooksDetails';
  @override
  State<GoogleBooksDetails> createState() => _GoogleBooksDetailsState();
}

class _GoogleBooksDetailsState extends State<GoogleBooksDetails> {
  late Books books;

  @override
  Widget build(BuildContext context) {
    books = ModalRoute.of(context)!.settings.arguments as Books;
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorManager.whiteColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(
            color: ColorManager.mainColor //change your color here
            ),
        title: const Text(
          'Book Details',
          style: TextStyle(color: ColorManager.blackColor),
        ),
        centerTitle: true,
      ),
      body: GoogleBookDetailsWidget(books),
    );
  }
}
