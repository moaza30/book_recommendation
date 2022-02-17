import 'dart:convert';
import 'package:book_recommendation/models/books.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class BooksProvider with ChangeNotifier {
  String baseUrl = 'https://www.googleapis.com/books/v1';
  List<Books> books = [];

  Future<void> getBooks() async {
    Uri link = Uri.parse('$baseUrl/volumes?q=flutter');
    http.Response response = await http.get(link);
    final jsonData = jsonDecode(response.body)['items'];
    List<Books> bookList = [];
    for (var item in jsonData) {
      bookList.add(Books.fromJson(item));
    }
    books.addAll(bookList);
    print(books);
    notifyListeners();
  }

  // Future<Books> getBooksDetails() async {}
}
