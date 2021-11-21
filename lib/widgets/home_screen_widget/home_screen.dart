import 'package:book_recommendation/widgets/home_screen_widget/list_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'For You',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Color.fromRGBO(90, 189, 140, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListItem(),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Color.fromRGBO(90, 189, 140, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListItem(),
          ],
        ),
      ),
    );
  }
}
