import 'package:book_recommendation/controllers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Provider.of<AuthProvider>(context, listen: false).logut();
          },
          child: Text("Sign out"),
        ),
        Text('Welcome  ${FirebaseAuth.instance.currentUser!.displayName!}'),
      ],
    ));
  }
}
