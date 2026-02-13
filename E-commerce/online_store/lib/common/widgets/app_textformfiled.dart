import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_store/core/const/app_color.dart';

class AppTextformfiled extends StatelessWidget {
  const AppTextformfiled({
    super.key,
    required this.keyboardType,
    required this.prefixIcon,
    required this.hintText,
    required this.textInputAction,
    this.controller,
    this.validator,
    this.obscureText,
    this.suffixicon,
    required this.borderRadius,
    this.height,
    this.width,
    this.contentPadding,
  });

  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final Widget prefixIcon;
  final Widget hintText;
  final Widget? suffixicon;
  final bool? obscureText;
  final BorderRadius borderRadius;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? contentPadding;
  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: validator,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height,
              width: width,
              child: TextFormField(
                cursorHeight: 24,
                cursorErrorColor: AppColor.b,
                cursorColor: AppColor.b,
                style: TextStyle(fontSize: 12),
                controller: controller,
                textInputAction: textInputAction,
                keyboardType: keyboardType,
                obscureText: obscureText ?? false,
                onChanged: (value) => field.didChange(value),
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  contentPadding: contentPadding,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: BorderSide(color: AppColor.b2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: BorderSide(color: AppColor.b),
                  ),
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixicon,
                  hint: hintText,
                ),
              ),
            ),
            if (field.errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 1),
                child: Row(
                  children: [
                    Icon(Icons.error, color: Colors.red),
                    SizedBox(width: 5),
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
