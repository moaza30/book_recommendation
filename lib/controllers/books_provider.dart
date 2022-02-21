import 'dart:convert';
import 'package:book_recommendation/models/books_api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class BooksProvider with ChangeNotifier {
  String baseUrl = 'https://www.googleapis.com/books/v1';
  List<Books> books = [];

  Future<List<Books>?> getBooks() async {
    try {
      Uri link = Uri.parse('$baseUrl/volumes?q=flutter');
      /* final response = await http.get(Uri.parse(
        "https://www.googleapis.com/books/v1/volumes?q=$query&startIndex=$page&maxResults=40")); */
      http.Response response = await http.get(link);
      final jsonData = jsonDecode(response.body)['items'];
      List<Books> bookList = [];
      for (var item in jsonData) {
        bookList.add(Books.fromJson(item));
      }
      books.addAll(bookList);
      return books;
      //ChangeNotifier();
    } catch (error) {
      print(error);
    }
  }
}
