import 'package:book_recommendation/controllers/books_provider.dart';
import 'package:book_recommendation/models/books_api_manager.dart';
import 'package:book_recommendation/views/widgets/home_screen_widget/book_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../consts/color_manager.dart';

class SearchResult extends StatefulWidget {
  static const String routename = 'SearchResult';

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  String? bookName;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    bookName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          iconTheme: const IconThemeData(color: ColorManager.mainColor),
          backgroundColor: ColorManager.whiteColor,
          title: const Text(
            'Search Result',
            style: TextStyle(color: ColorManager.mainColor),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder<List<Books>?>(
                  future: Provider.of<BooksProvider>(context, listen: false)
                      .searchBooks(bookName!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    if (snapshot.data == null) {
                      return const Center(
                        child: Text(
                          'No results Please try again',
                          style: TextStyle(color: ColorManager.mainColor),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return BooksView(snapshot.data![index]);
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
