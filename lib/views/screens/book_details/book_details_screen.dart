import 'package:book_recommendation/models/books_api_manager.dart';
import 'package:book_recommendation/views/screens/book_details/content_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BooksDetails extends StatefulWidget {
  static const String routename = 'BooksDetails';
  @override
  State<BooksDetails> createState() => _BooksDetailsState();
}

class _BooksDetailsState extends State<BooksDetails> {
  late Books books;

  @override
  Widget build(BuildContext context) {
    books = ModalRoute.of(context)!.settings.arguments as Books;
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
      body: BookDetailsWidget(books),
    );
  }
}
