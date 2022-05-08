import 'package:book_recommendation/views/screens/home_screen/main_screen.dart';
import 'package:book_recommenda'
    'tion/views/widgets/home_screen_widget/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  int currentScreenIndex = 0;
  @override
  void changeScreen() {
    if (currentScreenIndex == 0) {
      currentScreenIndex = 1;
    } else {
      currentScreenIndex = 0;
    }
    notifyListeners();
  }

  Future<String?> createAccount(
      String email, String password, String username) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseAuth.instance.currentUser!.updateDisplayName(username);
      currentScreenIndex = 0;

      notifyListeners();
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      return 'Error has occurred please try again later.';
    }
  }

//**********************
  Future<String?> login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    } catch (e) {
      return 'Error has occurred please try again later.';
    }
  }

  Future<String?> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      return "Error has occurred Please try again later";
    }
  }

  void logut() {
    FirebaseAuth.instance.signOut();
  }
}
