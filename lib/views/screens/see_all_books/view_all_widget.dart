import 'package:book_recommendation/consts/color_manager.dart';
import 'package:book_recommendation/models/books_model.dart';
import 'package:book_recommendation/views/screens/book_details/google_books_details.dart';
import 'package:flutter/material.dart';

class ViewAllBooks extends StatelessWidget {
  final BookModel books;
  ViewAllBooks(this.books);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: ColorManager.mainColor,
      onTap: () {
        Navigator.of(context)
            .pushNamed(GoogleBooksDetails.routename, arguments: books);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.30,
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.black2,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.asset(
                  "assets/images/book_cover.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Text(
                    books.title!,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    "Author: ${books.authors!}",
                    softWrap: false,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.greyColor,
                    ),
                  ),
                ),
                Text(
                  "Pages: ${books.pages!.toInt()}",
                  softWrap: false,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.greyColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
