import 'package:book_recommendation/consts/color_manager.dart';
import 'package:book_recommendation/views/screens/search_result/search_result.dart';
import 'package:flutter/material.dart';
import 'package:book_recommendation/views/widgets/text_utils.dart';

class CategoryScreen extends StatelessWidget {
  List<String> categoryList = [
    "Action and Adventure",
    "Classics",
    "Comic Book or Graphic Novel",
    "Detective and Mystery",
    "Fantasy",
    "Historical Fiction",
    "Horror",
    "Literary Fiction",
    "Science Fiction (Sci-Fi)",
    "Short Stories",
    "Suspense and Thrillers",
    "Cookbooks",
    "History",
    "Poetry",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            splashColor: ColorManager.mainColor,
            onTap: () {
              Navigator.of(context).pushNamed(SearchResult.routename,
                  arguments: categoryList[index]);
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorManager.whiteColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0.1,
                    blurRadius: 3,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Center(
                child: TextUtils(
                  text: categoryList[index],
                  fontSize: 16,
                  textColor: ColorManager.blackColor,
                  fontWeight: FontWeight.w500,
                  underLine: TextDecoration.none,
                ),
              ),
            ),
          );
        },
        itemCount: categoryList.length,
      ),
    );
  }
}
