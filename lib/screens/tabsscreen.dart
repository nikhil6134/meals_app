import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favourite_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class Tabscreen extends StatefulWidget {
  final List<Meal> favoritemeals;

  Tabscreen(this.favoritemeals);

  @override
  _TabscreenState createState() => _TabscreenState();
}

class _TabscreenState extends State<Tabscreen> {
  @override
  List<Map<String, Object>> _pages;

  int _selectedpageindex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoriteScreen(widget.favoritemeals), 'title': 'Your Favourites'}
    ];

    // TODO: implement initState
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedpageindex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedpageindex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedpageindex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category),
                backgroundColor: Theme.of(context).primaryColor,
                title: Text('Categories')),
            BottomNavigationBarItem(
                icon: Icon(Icons.star),
                backgroundColor: Theme.of(context).primaryColor,
                title: Text('Favorites')),
          ]),
    );

    //return DefaultTabController(

    //  length: 2,
    //  child: Scaffold(
    //  appBar: AppBar(
    //     title: Text('Meals'),
    //   bottom: TabBar(tabs: <Widget>[
    //   Tab(
    //      icon: Icon(
    //    Icons.category,
    //   ),
    //  text: 'Categories',
    // ),
    // Tab(
    //  icon: Icon(Icons.star),
    //  text: 'Favourites',
    // )
    //]),
    // ),
    // body: TabBarView(
    //   children: <Widget>[
    //    CategoriesScreen(),
    //   FavouriteScreen(),
    // ],
    //),
    //  )); for tabs in app bar we use this qpproach
  }
}
