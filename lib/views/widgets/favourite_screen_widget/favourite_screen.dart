import 'package:book_recommendation/models/books_id.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../models/books_api_manager.dart';
import '../../screens/book_details/book_details_screen.dart';

class FavouriteScreen extends StatelessWidget {
  final Books? books;
  FavouriteScreen({this.books});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          child: const Text(
            'Favourites',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        StreamBuilder<QuerySnapshot>(
            stream: null,
            builder: (context, snapshot) {
              FirebaseFirestore.instance
                  .collection('booksID')
                  .where('userId',
                      isEqualTo: FirebaseAuth.instance.currentUser!.email)
                  .get()
                  .asStream();
              print(BooksId.fromJson(snapshot.data!.docs[0]));
              return Expanded(
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(BooksDetails.routename,
                            arguments: books);
                      },
                      child: Image.asset('assets/images/Rectangle 307.png'),
                    );
                  },
                ),
              );
            }),
      ],
    );
  }
}
