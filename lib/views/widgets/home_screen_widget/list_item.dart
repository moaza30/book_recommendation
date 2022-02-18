import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  String? title, authors, thumbnail;
  ListItem(this.title, this.authors, this.thumbnail);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.33,
      margin: const EdgeInsets.only(right: 5, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.23,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.network(
                thumbnail ?? "",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 15, bottom: 5),
            child: Text(
              title ?? '',
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.fade,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            authors ?? '',
            softWrap: false,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(132, 132, 132, 1),
            ),
          ),
        ],
      ),
    );
  }
}
