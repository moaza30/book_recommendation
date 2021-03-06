import 'package:book_recommendation/consts/color_manager.dart';
import 'package:book_recommendation/models/books_api_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class GoogleBookDetailsWidget extends StatelessWidget {
  late Books books;
  bool isFavorite = false;
  GoogleBookDetailsWidget(this.books);

  CollectionReference booksID =
      FirebaseFirestore.instance.collection('booksID');

  @override
  Widget build(BuildContext context) {
    void addFavorite() {
      if (isFavorite == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'This books added to your favorites',
              textAlign: TextAlign.center,
            ),
            duration: Duration(seconds: 1),
            backgroundColor: ColorManager.mainColor,
          ),
        );
      }
    }

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
              "Published At: ${books.publishedDate}",
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
                    primary: ColorManager.mainColor,
                    side: const BorderSide(
                      color: ColorManager.mainColor,
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
                  valueChanged: (_isFavorite) {
                    addFavorite();
                    isFavorite = !isFavorite;
                  },
                  isFavorite: false),
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
                    colorClickableText: ColorManager.mainColor,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
