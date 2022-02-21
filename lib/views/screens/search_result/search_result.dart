import 'package:book_recommendation/models/books_model.dart';
import 'package:book_recommendation/services/search_services.dart';
import 'package:book_recommendation/views/widgets/home_screen_widget/book_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchResult extends StatelessWidget {
  static const String routename = 'SearchResult';
  String? bookName;

  @override
  Widget build(BuildContext context) {
    bookName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
        appBar: AppBar(
          title: Text('Search Result'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder<List<Books>?>(
                  future: Provider.of<SearchServices>(context, listen: false)
                      .searchBooks(bookName!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    }
                    if (snapshot.data == null) {
                      return const Center(
                        child: Text(
                          'No results Please try again',
                          style:
                              TextStyle(color: Color.fromRGBO(90, 189, 140, 1)),
                        ),
                      );
                    } else {
                      return Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return BookList(snapshot.data![index]);
                          },
                        ),
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
