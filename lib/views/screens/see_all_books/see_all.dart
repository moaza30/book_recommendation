import 'package:book_recommendation/consts/color_manager.dart';
import 'package:book_recommendation/controllers/books_provider.dart';
import 'package:book_recommendation/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_all_widget.dart';

class SeeAllBooks extends StatelessWidget {
  static const String routename = 'SeeAllBooks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          iconTheme: const IconThemeData(color: ColorManager.mainColor),
          backgroundColor: ColorManager.whiteColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder<List<BookModel>?>(
                  future: Provider.of<BooksProvider>(context, listen: false)
                      .getBooks(),
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
                        itemCount: 200,
                        itemBuilder: (context, index) {
                          return ViewAllBooks(snapshot.data![index]);
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
