import 'package:book_recommendation/controllers/auth_provider.dart';
import 'package:book_recommendation/views/screens/start_screen/start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
            child: const Text("Sign out"),
          ),
          StreamBuilder(
            stream: FirebaseAuth.instance.userChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: const CircularProgressIndicator.adaptive());
              }
              if (snapshot.data != null) {
                return Text(
                    'Welcome  ${FirebaseAuth.instance.currentUser?.displayName!}');
              } else {
                return Text('no user');
              }
            },
          ),
        ],
      ),
    );
  }
}
