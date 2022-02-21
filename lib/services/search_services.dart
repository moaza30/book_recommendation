import 'dart:convert';
import 'package:book_recommendation/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchServices with ChangeNotifier {
  String baseUrl = 'https://www.googleapis.com/books/v1';
  List<Books> books = [];

  Future<List<Books>?> searchBooks(String? bookName) async {
    print(bookName);
    try {
      Uri link = Uri.parse('$baseUrl/volumes?q=$bookName');
      http.Response response = await http.get(link);
      final jsonData = jsonDecode(response.body)['items'];
      List<Books> bookList = [];
      for (var item in jsonData) {
        bookList.add(Books.fromJson(item));
      }
      books.addAll(bookList);
      return books;
    } catch (error) {
      print(error);
    }
  }
}
