import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_store/common/widgets/appelevatedbutton.dart';
import 'package:online_store/core/const/app_color.dart';
import 'package:online_store/features/profile/busines_logic_layer/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(() {
          final imageUrl = profileController.image.value.trim();
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: profileController.isUploading.value
                    ? null
                    : profileController.changeImage,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      backgroundImage: imageUrl.isNotEmpty
                          ? NetworkImage(imageUrl)
                          : null,
                      child: imageUrl.isEmpty
                          ? Icon(Icons.person, size: 55, color: AppColor.b)
                          : null,
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColor.b3,
                      child: profileController.isUploading.value
                          ? const SizedBox(
                              width: 14,
                              height: 14,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(
                              Icons.camera_alt,
                              size: 16,
                              color: Colors.white,
                            ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                profileController.name.value.isEmpty
                    ? 'User'
                    : profileController.name.value,
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              if (profileController.email.value.isNotEmpty)
                Text(
                  profileController.email.value,
                  style: GoogleFonts.lato(color: AppColor.b, fontSize: 14),
                ),
              if (profileController.phone.value.isNotEmpty)
                Text(
                  profileController.phone.value,
                  style: GoogleFonts.lato(color: AppColor.b2, fontSize: 13),
                ),
              const SizedBox(height: 8),
              Text(
                'Tap the photo to change it',
                style: GoogleFonts.lato(color: AppColor.b2, fontSize: 12),
              ),
              const SizedBox(height: 32),
              AppElevatedbutton(
                onPressed: profileController.logout,
                title: 'Log Out',
                backgroundColor: AppColor.b3,
              ),
            ],
          );
        }),
      ),
    );
  }
}
