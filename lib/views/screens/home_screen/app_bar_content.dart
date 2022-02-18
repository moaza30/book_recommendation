import 'package:flutter/material.dart';

class AppBarContent extends StatelessWidget {
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
          margin: EdgeInsets.only(right: 10),
          height: 35,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
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
                color: Colors.black,
              ),
            ),
          ),
        ),
        Image.asset('assets/images/profile.png'),
      ],
    );
  }
}
