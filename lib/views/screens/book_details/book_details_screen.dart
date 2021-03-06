import 'package:book_recommendation/consts/color_manager.dart';
import 'package:book_recommendation/models/books_model.dart';
import 'package:book_recommendation/views/screens/book_details/content_widget.dart';
import 'package:flutter/material.dart';

class BooksDetails extends StatefulWidget {
  static const String routename = 'BooksDetails';
  @override
  State<BooksDetails> createState() => _BooksDetailsState();
}

class _BooksDetailsState extends State<BooksDetails> {
  late BookModel books;

  @override
  Widget build(BuildContext context) {
    books = ModalRoute.of(context)!.settings.arguments as BookModel;
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
      body: BookDetailsWidget(books),
    );
  }
}
