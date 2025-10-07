import 'package:clothing_store/bag.dart';
import 'package:clothing_store/categories.dart';
import 'package:clothing_store/classes/routes.dart';
import 'package:clothing_store/favorites.dart';
import 'package:clothing_store/forgot_password_page.dart';
import 'package:clothing_store/login_page.dart';
import 'package:clothing_store/navegator.dart';
import 'package:clothing_store/profile.dart';
import 'package:clothing_store/search.dart';
import 'package:clothing_store/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyStore());
}

class MyStore extends StatelessWidget {
  const MyStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clothing Store',
      routes: {
        Routes.signup: (context) => SignupPage(),
        Routes.login: (context) => LoginPage(),
        Routes.forgotpassword: (context) => ForgotPasswordPage(),
        Routes.categories: (context) => Categories(),
        Routes.bag: (context) => Bag(),
        Routes.profile: (context) => Profile(),
        Routes.favorites: (context) => Favorites(),
        Routes.search: (context) => SearchPage(),
        Routes.navegator: (context) => Navegator(),
      },

      initialRoute: Routes.signup,
    );
  }
}
