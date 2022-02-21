import 'dart:convert';

import 'package:book_recommendation/models/books_model.dart';

import 'package:http/http.dart' as http;

class BooksApiManager {
  String baseUrl = 'https://www.googleapis.com/books/v1';

  Future<List<Books>?> getBooks() async {
    Uri link = Uri.parse('$baseUrl/volumes?q=flutter');
    /* final response = await http.get(Uri.parse(
        "https://www.googleapis.com/books/v1/volumes?q=$query&startIndex=$page&maxResults=40")); */
    http.Response response = await http.get(link);
    final jsonData = jsonDecode(response.body)['items'];
    return jsonData;
  }
}
