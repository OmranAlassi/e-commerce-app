import 'package:clothing_store/classes/categoriestyle.dart';
import 'package:clothing_store/classes/profilestyle.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: profilestyles2[0].color,
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        backgroundColor: categoriestyles[0].color,
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text(
                'Favorites',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Metropolis',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Center(
                child: Text(
                  'No results found',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
