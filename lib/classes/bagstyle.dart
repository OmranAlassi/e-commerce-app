import 'package:flutter/material.dart';

class Bagstyle {
  String title;
  String? image;
  Color color;
  Bagstyle({required this.title, this.image, required this.color});
}

List<Bagstyle> bagstyles = [
  Bagstyle(title: 'My Bag', color: Color(0XFF222222)),
  Bagstyle(title: 'CHECK OUT', color: Color(0XFFDB3022)),
  Bagstyle(title: '59\$', color: Color(0XFF9B9B9B)),
  Bagstyle(title: 'Enter your promo code', color: Color(0XFF9B9B9B)),
  Bagstyle(title: 'Total amount:', color: Color(0XFF9B9B9B)),
  Bagstyle(title: '124\$', color: Color(0XFF9B9B9B)),
];

List<Bagstyle> bagstyles2 = [
  Bagstyle(
    title: '25\$',
    image: 'assets/images/6e2a6075d2aebb9b52db31deea621f309362bab4.png',
    color: Colors.black,
  ),
  Bagstyle(
    title: '15\$',
    image: 'assets/images/1770088fbba96a73adb59b4213783033221c4b94.png',
    color: Colors.black,
  ),
  Bagstyle(
    title: '19\$',
    image: 'assets/images/18215f62e259b4c9081785e2fb7f4b553d1a8023.png',
    color: Colors.black,
  ),
];

List<Bagstyle> bagstyles3 = [
  Bagstyle(title: 'Dress', color: Color(0XFFFFFFFF)),
  Bagstyle(title: 'T-Shirt', color: Colors.white),
  Bagstyle(title: 'Sport Dress', color: Colors.white),
];
List<String> titles = ['Black', 'Blue', 'Black'];
List<String> titles2 = ['L', 'L', 'M'];
