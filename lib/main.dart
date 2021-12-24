import 'package:book_recommendation/screens/home_screen/main_screen.dart';
import 'package:book_recommendation/screens/sign_in_screen/sign_in_screnn.dart';
import 'package:book_recommendation/screens/sign_up_screen/sign_up_screen.dart';
import 'package:book_recommendation/screens/start_screen/start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book R',
      home: StreamBuilder(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            }
            if (snapshot.data == null) {
              return StartScreen();
            } else {
              return MainScreen();
            }
          }),
      routes: {
        SignUpScreen.routename: (context) => SignUpScreen(),
        StartScreen.routename: (context) => StartScreen(),
        SignInScreen.routename: (context) => SignInScreen(),
        MainScreen.routeName: (context) => MainScreen(),
      },
    );
  }
}
