import 'package:book_recommendation/controllers/books_provider.dart';
import 'package:book_recommendation/views/screens/home_screen/app_bar_content.dart';
import 'package:book_recommendation/views/widgets/category_screen_widget/category_screen.dart';
import 'package:book_recommendation/views/widgets/favourite_screen_widget/favourite_screen.dart';
import 'package:book_recommendation/views/widgets/home_screen_widget/home_screen.dart';
import 'package:book_recommendation/views/widgets/menu_screen_widget/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../consts/color_manager.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int currentScreenIndex;
  BooksProvider? test;
  final RefreshController _refreshController =
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
    test = Provider.of<BooksProvider>(context, listen: false);
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
    /* test!.booksFuture =
        Provider.of<BooksProvider>(context, listen: false).getBooks();*/
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
      backgroundColor: ColorManager.whiteColor,
      appBar: (currentScreenIndex == 3)
          ? AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: ColorManager.whiteColor,
              elevation: 0.0,
              title: Text(''),
            )
          : AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: ColorManager.whiteColor,
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
            selectedItemColor: ColorManager.mainColor,
            unselectedItemColor: ColorManager.blackColor,
            onTap: (index) {
              currentScreenIndex = index;
              setState(() {});
            },
            iconSize: 30,
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: (currentScreenIndex == 0)
                    ? const ImageIcon(
                        AssetImage('assets/icons/home-filled.png'),
                      )
                    : const ImageIcon(
                        AssetImage('assets/icons/home_ico.png'),
                      ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: (currentScreenIndex == 1)
                    ? const ImageIcon(
                        AssetImage('assets/icons/fav-filled.png'),
                      )
                    : const ImageIcon(
                        AssetImage('assets/icons/fav_ico.png'),
                      ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: (currentScreenIndex == 2)
                    ? const ImageIcon(
                        AssetImage('assets/icons/categ-filled.png'),
                      )
                    : const ImageIcon(
                        AssetImage('assets/icons/category_ico.png'),
                      ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: (currentScreenIndex == 3)
                    ? const ImageIcon(
                        AssetImage('assets/icons/menu-filled.png'),
                      )
                    : const ImageIcon(
                        AssetImage('assets/icons/menu_ico.png'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
