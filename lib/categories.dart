import 'package:clothing_store/classes/categoriestyle.dart';
import 'package:clothing_store/classes/routes.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        backgroundColor: categoriestyles[0].color,
        title: Text(
          categoriestyles[0].title,
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_outlined),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.search);
              },
              icon: Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 8),
              height: 44,
              width: double.infinity,
              decoration: BoxDecoration(color: categoriestyles[0].color),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          categoriestyles[1].title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Metropolis',
                          ),
                        ),
                      ),
                      Spacer(flex: 3),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          categoriestyles[2].title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Metropolis',
                          ),
                        ),
                      ),
                      Spacer(flex: 3),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          categoriestyles[3].title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Metropolis',
                          ),
                        ),
                      ),
                      Spacer(flex: 2),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 41),
                    child: Container(
                      height: 3,
                      width: MediaQuery.of(context).size.width * 0.31,
                      decoration: BoxDecoration(
                        color: categoriestyles[2].color,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.92,
                child: PageView.builder(
                  itemCount: categoriestyles2.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: categoriestyles2[index].color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            categoriestyles2[0].title,
                            style: TextStyle(
                              color: categoriestyles[0].color,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Metropolis',
                            ),
                          ),
                          Text(
                            categoriestyles2[1].title,
                            style: TextStyle(
                              color: categoriestyles[0].color,
                              fontSize: 14,
                              fontFamily: 'Metropolis',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: categoriestyle3.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Container(
                    height: 100,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    width: MediaQuery.of(context).size.width * 0.92,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                      color: categoriestyles[0].color,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: Text(
                            categoriestyle3[index].title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Metropolis',
                            ),
                          ),
                        ),

                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.43,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                            image: DecorationImage(
                              image: AssetImage(categoriestyle3[index].image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
