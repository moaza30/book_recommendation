import 'package:book_recommendation/models/books.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  late Books books;
  @override
  Widget build(BuildContext context) {
    books = ModalRoute.of(context)!.settings.arguments as Books;
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, builder) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Image.network(books.thumbnail),
                Container(
                  width: 130,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    books.title!,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  books.authors!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(132, 132, 132, 1),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
