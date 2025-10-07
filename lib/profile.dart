import 'package:clothing_store/classes/categoriestyle.dart';
import 'package:clothing_store/classes/profilestyle.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                profilestyles[0].title,
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Metropolis',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(profilestyles[0].image!),
                    radius: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, left: 12),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 42),
                          child: Text(
                            profilestyles[1].title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Metropolis',
                            ),
                          ),
                        ),
                        Text(
                          profilestyles[2].title,
                          style: TextStyle(
                            fontSize: 14,
                            color: profilestyles[1].color,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Metropolis',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: profilestyles2.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 25, left: 3, right: 3),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              profilestyles2[index].title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Metropolis',
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: profilestyles[1].color,
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: profilestyles[1].color,
                        height: 1,
                        thickness: 0,
                      ),
                    ],
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
