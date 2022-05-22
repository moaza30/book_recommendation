import 'package:book_recommendation/consts/color_manager.dart';
import 'package:book_recommendation/controllers/books_provider.dart';
import 'package:book_recommendation/models/books_api_manager.dart';
import 'package:book_recommendation/views/screens/book_details/book_details_screen.dart';
import 'package:book_recommendation/views/widgets/home_screen_widget/list_item.dart';
import 'package:book_recommendation/views/widgets/home_screen_widget/book_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Books book;

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
        ],
      ),
    );
  }
}
