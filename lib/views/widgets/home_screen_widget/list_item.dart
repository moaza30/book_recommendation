import 'package:book_recommendation/controllers/books_provider.dart';
import 'package:book_recommendation/models/books_api_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListItem extends StatelessWidget {
  String? title, authors, thumbnail;
  ListItem(this.title, this.authors, this.thumbnail);
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.30,
      width: MediaQuery.of(context).size.width * 0.30,
      child: Container(
        margin: const EdgeInsets.only(right: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              thumbnail ?? "",
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              width: 130,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                title ?? '',
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              authors ?? '',
              maxLines: 2,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(132, 132, 132, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
