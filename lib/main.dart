import 'package:book_recommendation/controllers/books_provider.dart';
import 'package:book_recommendation/views/screens/auth_screnn.dart';
import 'package:book_recommendation/views/screens/book_details/book_details_screen.dart';
import 'package:book_recommendation/views/screens/book_details/google_books_details.dart';
import 'package:book_recommendation/views/screens/main_screen/main_screen.dart';
import 'package:book_recommendation/views/screens/search_result/search_result.dart';
import 'package:book_recommendation/views/screens/sign_in_screen/sign_in_screnn.dart';
import 'package:book_recommendation/views/screens/sign_up_screen/sign_up_screen.dart';
import 'package:book_recommendation/views/screens/start_screen/start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/auth_provider.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => BooksProvider()),
      ],
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
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          }
          if (snapshot.data != null) {
            return MainScreen();
          } else {
            return AuthScreen();
          }
        },
      ),
      routes: {
        SignUpScreen.routename: (context) => SignUpScreen(),
        StartScreen.routename: (context) => StartScreen(),
        SignInScreen.routename: (context) => SignInScreen(),
        MainScreen.routeName: (context) => MainScreen(),
        BooksDetails.routename: (context) => BooksDetails(),
        GoogleBooksDetails.routename: (context) => GoogleBooksDetails(),
        SearchResult.routename: (context) => SearchResult(),
      },
    );
  }
}
