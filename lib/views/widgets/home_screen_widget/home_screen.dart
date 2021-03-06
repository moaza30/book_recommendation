import 'package:book_recommendation/consts/color_manager.dart';
import 'package:book_recommendation/controllers/books_provider.dart';
import 'package:book_recommendation/models/books_api_manager.dart';
import 'package:book_recommendation/models/books_model.dart';
import 'package:book_recommendation/views/screens/see_all_books/see_all.dart';
import 'package:book_recommendation/views/screens/see_all_books/view_all_widget.dart';
import 'package:book_recommendation/views/widgets/home_screen_widget/google_books.dart';
import 'package:book_recommendation/views/widgets/home_screen_widget/book_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      SeeAllBooks.routename,
                    );
                  },
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      color: ColorManager.mainColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.30,
            child: FutureBuilder<List<BookModel>?>(
              future:
                  Provider.of<BooksProvider>(context, listen: false).getBooks(),
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
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return BookList(snapshot.data![index]);
                      },
                    ),
                  );
                }
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      color: ColorManager.mainColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.30,
            child: FutureBuilder<List<Books>?>(
              future: Provider.of<BooksProvider>(context, listen: false)
                  .getGoogleBooks(),
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
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return GoogleBooks(snapshot.data![index]);
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
