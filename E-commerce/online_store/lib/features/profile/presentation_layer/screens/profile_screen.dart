import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_store/common/widgets/appelevatedbutton.dart';
import 'package:online_store/core/const/app_color.dart';
import 'package:online_store/core/routing/routing_manager.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppElevatedbutton(
              onPressed: () {
                box.remove('token');
                Get.offAllNamed(RoutingManager.loginScr);
              },
              title: 'Log Out',
              backgroundColor: AppColor.b3,
            ),
          ],
        ),
      ),
    );
  }
}
