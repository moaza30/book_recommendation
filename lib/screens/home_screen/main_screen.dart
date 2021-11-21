import 'package:book_recommendation/screens/home_screen/app_bar_content.dart';
import 'package:book_recommendation/widgets/category_screen_widget/category_screen.dart';
import 'package:book_recommendation/widgets/favourite_screen_widget/favourite_screen.dart';
import 'package:book_recommendation/widgets/home_screen_widget/home_screen.dart';
import 'package:book_recommendation/widgets/menu_screen_widget/menu_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int currentScreenIndex;
  //************************
  List screens = [
    HomeScreen(),
    FavouriteScreen(),
    CategoryScreen(),
    MenuScreen(),
  ];
  // function for select widget
  @override
  void initState() {
    super.initState();
    currentScreenIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: AppBarContent(),
      ),
      body: screens[currentScreenIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black26, spreadRadius: 0, blurRadius: 25),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: currentScreenIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color.fromRGBO(90, 189, 140, 1.0),
            unselectedItemColor: Colors.black,
            onTap: (index) {
              currentScreenIndex = index;
              setState(() {});
            },
            iconSize: 30,
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: Container(
                  padding: EdgeInsets.only(top: 13),
                  child: ImageIcon(
                    AssetImage('assets/icons/home_ico.png'),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Container(
                  padding: EdgeInsets.only(top: 13),
                  child: ImageIcon(
                    AssetImage('assets/icons/fav_ico.png'),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Container(
                  padding: EdgeInsets.only(top: 13),
                  child: ImageIcon(
                    AssetImage('assets/icons/category_ico.png'),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Container(
                  padding: EdgeInsets.only(top: 13),
                  child: ImageIcon(
                    AssetImage('assets/icons/menu_ico.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
