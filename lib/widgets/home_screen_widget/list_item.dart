import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, builder) {
          return Container(
            margin: EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/Rectangle 307.png'),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'The Catcher in the Rye',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  'by J.D. Salinger',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(132, 132, 132, 1),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
