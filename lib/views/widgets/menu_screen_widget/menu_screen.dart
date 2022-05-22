import 'package:book_recommendation/controllers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      //   height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          const CircleAvatar(
              radius: 60,
              backgroundImage:
                  ExactAssetImage('assets/images/Rectangle 307.png')),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: StreamBuilder(
              stream: FirebaseAuth.instance.userChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }
                if (snapshot.data != null) {
                  return Text(
                    '${FirebaseAuth.instance.currentUser?.displayName!}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  );
                } else {
                  return Text(
                    'Mooaz Adel',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  );
                }
              },
            ),
          ),
          Text(
            '10 Books',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF707070)),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.centerLeft,
                primary: Colors.white,
                padding: const EdgeInsets.all(15),
              ),
              icon: const Icon(Icons.lock_open_outlined, color: Colors.black),
              onPressed: () {},
              label: const Text(
                "Change Password",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.centerLeft,
                primary: Colors.white,
                padding: const EdgeInsets.all(15),
              ),
              icon: const Icon(Icons.login_outlined, color: Colors.black),
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logOut();
              },
              label: const Text(
                "LogOut",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

