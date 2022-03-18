import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/books_api_manager.dart';

class SearchServices with ChangeNotifier {
  String baseUrl = 'https://www.googleapis.com/books/v1';
  List<Books> booksResult = [];

  Future<List<Books>?>? searchBooks(String? bookName) async {
    try {
      Uri link = Uri.parse('$baseUrl/volumes?q=$bookName');
      http.Response response = await http.get(link);
      final jsonData = jsonDecode(response.body)['items'];
      List<Books> bookList = [];
      for (var item in jsonData) {
        bookList.add(Books.fromJson(item));
      }
      booksResult.clear();
      booksResult.addAll(bookList);
      // notifyListeners();
      return booksResult;
    } catch (error) {
      print(error);
    }
  }
}
