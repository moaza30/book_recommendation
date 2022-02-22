import 'package:book_recommendation/models/books_model.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class BookDetailsWidget extends StatelessWidget {
  late Books books;
  bool isFavorite = false;

  BookDetailsWidget(this.books);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 10),
            child: Image.network(
              books.thumbnail!,
              height: 250,
              width: 180,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              books.title!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              'Published: ${books.publishedDate}',
              style: const TextStyle(color: Color(0xFFACB1B6), fontSize: 15),
            ),
          ),
          //Row for Buy and favorites buttons
          Row(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                width: MediaQuery.of(context).size.width * 0.75,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    primary: const Color.fromRGBO(90, 189, 140, 1),
                    side: const BorderSide(
                      color: Color.fromRGBO(90, 189, 140, 1),
                      width: 1.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Buy Now',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Spacer(),
              FavoriteButton(
                  valueChanged: (_isFavorite) {}, isFavorite: !isFavorite),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, top: 15),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15).add(
                    const EdgeInsets.only(right: 10),
                  ),
                  child: ReadMoreText(
                    books.description!,
                    trimLines: 3,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Read more',
                    trimExpandedText: 'Read less',
                    colorClickableText: Color.fromRGBO(90, 189, 140, 1),
                    style:
                        const TextStyle(fontSize: 16, color: Color(0xFF6D727A)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Books's Author",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  books.authors!,
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xFF6D727A)),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Other Suggestions',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
