import 'package:book_recommendation/consts/color_manager.dart';
import 'package:book_recommendation/consts/string_manager.dart';
import 'package:flutter/material.dart';
import '../text_utils.dart';

class languageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 7),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.whiteColor,
                  ),
                  child: const Icon(
                    Icons.language,
                    color: Colors.black,
                  ),
                ),
                TextUtils(
                  text: "Language",
                  fontSize: 16,
                  textColor: Colors.black,
                  underLine: TextDecoration.none,
                  fontWeight: FontWeight.w400,
                )
              ],
            ),
          ),
          Container(
            width: 120,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorManager.mainColor,
                width: 2,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: StringManager.en,
                onChanged: (value) {},
                iconSize: 25,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: ColorManager.mainColor,
                ),
                items: const [
                  DropdownMenuItem(
                    value: StringManager.en,
                    child: Text(
                      StringManager.englishFlag,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: StringManager.ar,
                    child: Text(
                      StringManager.arabicFlag,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
