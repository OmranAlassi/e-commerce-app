import 'package:clothing_store/bag.dart';
import 'package:clothing_store/categories.dart';
import 'package:clothing_store/classes/homestyle.dart';
import 'package:clothing_store/favorites.dart';
import 'package:clothing_store/home_page.dart';
import 'package:clothing_store/profile.dart';
import 'package:flutter/material.dart';

class Navegator extends StatefulWidget {
  const Navegator({super.key});

  @override
  State<Navegator> createState() => _NavegatorState();
}

class _NavegatorState extends State<Navegator> {
  int selectedindex = 0;
  List<Widget> pages = [
    const HomePage(),
    const Categories(),
    const Bag(),
    const Favorites(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: homestyles[0].color,
        selectedItemColor: homestyles[3].color,
        selectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          fontFamily: 'Metropolis',
          color: homestyles[4].color,
        ),
        unselectedIconTheme: IconThemeData(color: homestyles[4].color),
        iconSize: 30,
        unselectedItemColor: Colors.grey,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Shop',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Bag',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded),
            label: 'Favorites',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedindex,
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },
      ),
    );
  }
}
