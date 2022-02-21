import 'package:book_recommendation/models/books_model.dart';
import 'package:book_recommendation/services/search_services.dart';
import 'package:book_recommendation/views/screens/search_result/search_result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarContent extends StatelessWidget {
  String? bookName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 3),
              ),
            ],
          ),
          margin: const EdgeInsets.only(right: 10),
          height: 35,
          child: TextField(
            onSubmitted: (data) async {
              bookName = data;
              print(bookName);
              Navigator.of(context)
                  .pushNamed(SearchResult.routename, arguments: bookName);
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search for books here..',
              hintStyle: const TextStyle(
                fontSize: 13,
                color: Color.fromRGBO(33, 33, 33, 0.5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: const Icon(
                Icons.search,
                size: 28.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Image.asset('assets/images/profile.png'),
      ],
    );
  }
}
