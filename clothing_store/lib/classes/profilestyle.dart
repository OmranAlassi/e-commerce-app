import 'package:flutter/material.dart';

class Profilestyle {
  String title;
  String? image;
  Color color;
  Profilestyle({required this.title, this.image, required this.color});
}

List<Profilestyle> profilestyles = [
  Profilestyle(
    title: 'My profile',
    image: 'assets/images/581b273d1a360f84cfd9a99708fc889ab7d86e6c.png',
    color: Color(0XFF222222),
  ),
  Profilestyle(title: 'Matilda Brown', color: Color(0XFF9B9B9B)),
  Profilestyle(
    title: 'matildabrown@mail.com',
    image: '',
    color: Color(0XFF9B9B9B),
  ),
];
List<Profilestyle> profilestyles2 = [
  Profilestyle(title: 'My orders', color: Color(0XFFFFFFFF)),

  Profilestyle(
    title: 'Shipping addresses',
    image: '',
    color: Color(0XFF222222),
  ),

  Profilestyle(title: 'Payment methods', color: Color(0XFF222222)),

  Profilestyle(title: 'Promocodes', color: Color(0XFF222222)),

  Profilestyle(title: 'My reviews', color: Color(0XFF222222)),

  Profilestyle(title: 'Settings', color: Color(0XFF222222)),
];
