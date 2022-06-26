import 'dart:convert';
import 'package:book_recommendation/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/books_api_manager.dart';

class BooksProvider with ChangeNotifier {
  String baseUrl = 'https://www.googleapis.com/books/v1';
  final String _apikey = 'AIzaSyD0crpZjOGB67NKjG8hZw8rXFpeG66QukI';
  List<BookModel> booksList = [];
  List<Books> books = [];

  Future<List<BookModel>?> getBooks() async {
    try {
      Uri link = Uri.parse("https://must-book.herokuapp.com/api/books");
      http.Response response = await http.get(link);
      final jsonData = jsonDecode(response.body)['books'];
      List<BookModel> bookList = [];
      for (var item in jsonData) {
        bookList.add(BookModel.fromJson(item));
      }
      booksList.addAll(bookList);
      // ChangeNotifier();
      print(booksList[1]);
      return booksList;
    } catch (error) {
      print(error);
    }
  }
  /* Future<List<Books>?> getBooks() async {
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
      booksList.addAll(bookList);
      // ChangeNotifier();
      return booksList;
    } catch (error) {
      print(error);
    }
  }*/

  Future<List<Books>?>? searchBooks(String? bookName) async {
    try {
      Uri link = Uri.parse('$baseUrl/volumes?q=$bookName&key=$_apikey');
      http.Response response = await http.get(link);
      final jsonData = jsonDecode(response.body)['items'];
      List<Books> bookList = [];
      for (var item in jsonData) {
        bookList.add(Books.fromJson(item));
      }
      books.clear();
      books.addAll(bookList);
      notifyListeners();
      return books;
    } catch (error) {
      print(error);
    }
  }
}
