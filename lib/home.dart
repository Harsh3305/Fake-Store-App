import 'package:fake_store/pages/cart_page.dart';
import 'package:fake_store/pages/home_page.dart';
import 'package:fake_store/pages/settings_page.dart';
import 'package:fake_store/widgets/my_theme.dart';
import 'package:flutter/material.dart';

import 'pages/categories_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  late Widget _selectedWidget;
  String _title = "Home";
  @override
  Widget build(BuildContext context) {
    if (_selectedIndex == 0) {
      _selectedWidget = const HomePage();
    } else if (_selectedIndex == 1) {
      _selectedWidget = const CategoryPage();
    } else {
      _selectedWidget = const SettingsPage();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.primaryLight,
        title: Text(_title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage()));
            },
          )
        ],
      ),
      body: _selectedWidget,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: MyTheme.primaryLight,
        // selectedFontSize: 10,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int selectedIndex) {
    setState(() {
      _selectedIndex = selectedIndex;
      if (selectedIndex == 0) {
        _title = "Home";
      } else if (selectedIndex == 1) {
        _title = "Categories";
      } else {
        _title = "Settings";
      }
    });
  }
}
