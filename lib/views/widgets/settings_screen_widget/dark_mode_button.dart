import 'package:book_recommendation/consts/color_manager.dart';
import 'package:book_recommendation/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class darkModeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 20),
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
          buildIconWidget(),
          Switch(
            activeTrackColor: ColorManager.mainColor,
            activeColor: ColorManager.mainColor,
            value: false,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  Widget buildIconWidget() {
    return Material(
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
              Icons.dark_mode,
              color: Colors.black,
            ),
          ),
          TextUtils(
            text: "Dark Mode",
            fontSize: 16,
            textColor: ColorManager.blackColor,
            underLine: TextDecoration.none,
            fontWeight: FontWeight.w400,
          )
        ],
      ),
    );
  }
}
