import 'package:book_recommendation/controllers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dark_mode_button.dart';
import 'language_widget.dart';
import 'package:book_recommendation/consts/color_manager.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      //   height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          (FirebaseAuth.instance.currentUser?.photoURL == null)
              ? const CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      ExactAssetImage('assets/images/profile_pic.png'),
                )
              : CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                      '${FirebaseAuth.instance.currentUser?.photoURL!}'),
                ),
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
                    'Hello ${FirebaseAuth.instance.currentUser?.displayName!}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                } else {
                  return const Text(
                    'No User',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  );
                }
              },
            ),
          ),
          darkModeWidget(),
          languageWidget(),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
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
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.centerLeft,
                primary: Colors.white,
                padding: const EdgeInsets.all(15),
                elevation: 0.0,
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
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.centerLeft,
                primary: Colors.white,
                padding: const EdgeInsets.all(15),
                elevation: 0.0,
              ),
              icon: const Icon(Icons.login_outlined, color: Colors.red),
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logOut();
              },
              label: const Text(
                "LogOut",
                style: TextStyle(
                    color: Colors.red,
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
