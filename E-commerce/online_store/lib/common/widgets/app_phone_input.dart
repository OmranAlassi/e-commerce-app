import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_store/core/const/app_color.dart';
import 'package:online_store/core/const/app_icon.dart';

class AppPhoneInputBox extends StatelessWidget {
  const AppPhoneInputBox({
    super.key,
    required this.controller,
    required this.validator,
    required this.textInputAction,
  });
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              maxLength: 10,
              controller: controller,
              textInputAction: textInputAction,
              keyboardType: TextInputType.phone,
              onChanged: (val) => field.didChange(val),
              cursorHeight: 24,
              cursorErrorColor: AppColor.b,
              cursorColor: AppColor.b,
              style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                counterText: '',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColor.b2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColor.b),
                ),
                hintText: 'Write Your Phone Number',
                hintStyle: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  height: 1.4,
                  color: AppColor.b2,
                ),
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 19),
                    SvgPicture.asset(AppIcon.phone),
                    const SizedBox(width: 5),
                    Text(
                      '+963',
                      style: GoogleFonts.lato(
                        color: AppColor.b,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Container(
                      height: 28,
                      width: 1,
                      color: const Color(0xFF717171),
                    ),
                    const SizedBox(width: 4),
                  ],
                ),
              ),
            ),

            if (field.errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 1, right: 1),
                child: Row(
                  children: [
                    Icon(Icons.error, color: Colors.red),
                    const SizedBox(width: 5),
                    Text(
                      field.errorText!,
                      style: GoogleFonts.lato(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
