import 'package:book_recommendation/consts/color_manager.dart';
import 'package:book_recommendation/controllers/books_provider.dart';
import 'package:book_recommendation/models/books_model.dart';
import 'package:book_recommendation/views/widgets/home_screen_widget/book_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class BookDetailsWidget extends StatelessWidget {
  late BookModel books;
  bool isFavorite = false;
  BookDetailsWidget(this.books);

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
            child: Image.asset(
              "assets/images/book_cover.jpg",
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.31,
              fit: BoxFit.fill,
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
              'Pages: ${books.pages!.toInt()}',
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
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Other Suggestions',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: FutureBuilder<List<BookModel>?>(
                    future: Provider.of<BooksProvider>(context, listen: false)
                        .getBooks(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator.adaptive());
                      }
                      if (snapshot.data == null) {
                        return const Center(
                          child: Text(
                            'Error has occured Please try again later.',
                            style: TextStyle(color: ColorManager.mainColor),
                          ),
                        );
                      } else {
                        return Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return BookList(snapshot.data![index]);
                            },
                          ),
                        );
                      }
                    },
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
