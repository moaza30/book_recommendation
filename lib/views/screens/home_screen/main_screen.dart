import 'package:book_recommendation/controllers/books_provider.dart';
import 'package:book_recommendation/views/screens/home_screen/app_bar_content.dart';
import 'package:book_recommendation/views/widgets/category_screen_widget/category_screen.dart';
import 'package:book_recommendation/views/widgets/favourite_screen_widget/favourite_screen.dart';
import 'package:book_recommendation/views/widgets/home_screen_widget/home_screen.dart';
import 'package:book_recommendation/views/widgets/menu_screen_widget/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int currentScreenIndex;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  //************************
  List screens = [
    HomeScreen(),
    FavouriteScreen(),
    CategoryScreen(),
    MenuScreen(),
  ];
// This Function for pull up to refresh
  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
    Provider.of<BooksProvider>(context, listen: false).getBooks();
  }

  // function for select widget
  @override
  void initState() {
    super.initState();
    currentScreenIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: (currentScreenIndex == 3)
          ? AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Text(''),
            )
          : AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: AppBarContent(),
            ),
      body: SmartRefresher(
        enablePullDown: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: screens[currentScreenIndex],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black26, spreadRadius: 0, blurRadius: 25),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: currentScreenIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color.fromRGBO(90, 189, 140, 1.0),
            unselectedItemColor: Colors.black,
            onTap: (index) {
              currentScreenIndex = index;
              setState(() {});
            },
            iconSize: 30,
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: (currentScreenIndex == 0)
                    ? Container(
                        //padding: const EdgeInsets.only(bottom: 1),
                        child: const ImageIcon(
                          AssetImage('assets/icons/home-filled.png'),
                        ),
                      )
                    : Container(
                        child: const ImageIcon(
                          AssetImage('assets/icons/home_ico.png'),
                        ),
                      ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: (currentScreenIndex == 1)
                    ? Container(
                        child: const ImageIcon(
                          AssetImage('assets/icons/fav-filled.png'),
                        ),
                      )
                    : Container(
                        child: const ImageIcon(
                          AssetImage('assets/icons/fav_ico.png'),
                        ),
                      ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: (currentScreenIndex == 2)
                    ? Container(
                        //padding: const EdgeInsets.only(bottom: 1),
                        child: const ImageIcon(
                          AssetImage('assets/icons/categ-filled.png'),
                        ),
                      )
                    : Container(
                        child: const ImageIcon(
                          AssetImage('assets/icons/category_ico.png'),
                        ),
                      ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: (currentScreenIndex == 3)
                    ? Container(
                        //padding: const EdgeInsets.only(bottom: 1),
                        child: const ImageIcon(
                          AssetImage('assets/icons/menu-filled.png'),
                        ),
                      )
                    : Container(
                        child: const ImageIcon(
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
