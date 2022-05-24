import 'package:book_recommendation/views/screens/search_result/search_result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../consts/color_manager.dart';

class AppBarContent extends StatelessWidget {
  String? bookName;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 3),
              ),
            ],
          ),
          margin: const EdgeInsets.only(right: 10),
          height: 35,
          child: TextField(
            controller: controller,
            onSubmitted: (data) async {
              bookName = data;
              Navigator.of(context)
                  .pushNamed(SearchResult.routename, arguments: bookName);
              controller.clear();
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: ColorManager.whiteColor,
              hintText: 'Search for books here..',
              hintStyle: const TextStyle(
                fontSize: 13,
                color: Color.fromRGBO(33, 33, 33, 0.5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: const Icon(
                Icons.search,
                size: 28.0,
                color: ColorManager.blackColor,
              ),
            ),
          ),
        ),
        (FirebaseAuth.instance.currentUser?.photoURL == null)
            ? const Expanded(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  backgroundImage: ExactAssetImage('assets/images/profile.png'),
                ),
              )
            : Expanded(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                    '${FirebaseAuth.instance.currentUser?.photoURL!}',
                  ),
                ),
              ),
      ],
    );
  }
}
