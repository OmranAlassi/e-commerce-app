import 'package:flutter/material.dart';

class Categoriestyle {
  String title;
  String? image;
  Color color;
  Categoriestyle({required this.title, this.image, required this.color});
}

List<Categoriestyle> categoriestyles = [
  Categoriestyle(title: 'Categories', color: Color(0XFFFFFFFF)),
  Categoriestyle(title: 'Women', color: Color(0XFF222222)),
  Categoriestyle(title: 'Men', color: Color(0XFFDB3022)),
  Categoriestyle(title: 'Kids', color: Color(0XFFDB3022)),
];

List<Categoriestyle> categoriestyles2 = [
  Categoriestyle(title: 'SUMMER SALES', color: Color(0XFFDB3022)),
  Categoriestyle(title: 'Up to 50% off', color: Color(0XFF222222)),
];

List<Categoriestyle> categoriestyle3 = [
  Categoriestyle(
    title: 'New',
    image: 'assets/images/715c827ce012b7c12e4b2a5bc61b8683ec894a9b.png',
    color: Color(0XFFDB3022),
  ),
  Categoriestyle(
    title: 'Clothes',
    image: 'assets/images/4d8c7e9c1e3e38ccbde0b3617e6016fb65157ec3.png',
    color: Color(0XFFDB3022),
  ),
  Categoriestyle(
    title: 'Shoes',
    image: 'assets/images/ef749cf946b19562fcd50e353f20c0b75c070865.png',
    color: Color(0XFFDB3022),
  ),
  Categoriestyle(
    title: 'Accesories',
    image: 'assets/images/5bfc9b2c577233e2c04f0024ec9ea69388017eaf.png',
    color: Color(0XFFDB3022),
  ),
];
