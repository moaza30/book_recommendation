import 'package:book_recommendation/consts/color_manager.dart';
import 'package:book_recommendation/models/books_api_manager.dart';
import 'package:book_recommendation/views/screens/book_details/google_books_details.dart';
import 'package:flutter/material.dart';

class GoogleBooks extends StatelessWidget {
  final Books books;
  GoogleBooks(this.books);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: ColorManager.mainColor,
      onTap: () {
        Navigator.of(context)
            .pushNamed(GoogleBooksDetails.routename, arguments: books);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.30,
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.22,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.network(
                  books.thumbnail!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 5),
              child: Text(
                books.title!,
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.fade,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              books.authors!,
              softWrap: false,
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: ColorManager.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
