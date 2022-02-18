import 'package:book_recommendation/controllers/books_provider.dart';
import 'package:book_recommendation/views/widgets/home_screen_widget/list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(left: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'For You',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: Color.fromRGBO(90, 189, 140, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.30,
              child: (Provider.of<BooksProvider>(context).books.isEmpty)
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        final book =
                            Provider.of<BooksProvider>(context).books[index];
                        return ListItem(
                          book.title,
                          book.authors,
                          book.thumbnail,
                        );
                      },
                    ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: Color.fromRGBO(90, 189, 140, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //  ListItem(),
          ],
        ),
      ),
    );
  }
}
