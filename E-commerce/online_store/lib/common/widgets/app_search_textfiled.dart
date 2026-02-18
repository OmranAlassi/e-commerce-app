import 'package:flutter/material.dart';
import 'package:online_store/core/const/app_color.dart';

class AppSearchTextfiled extends StatelessWidget {
  const AppSearchTextfiled({
    super.key,
    required this.keyboardType,
    required this.prefixIcon,
    required this.hintText,
    required this.textInputAction,
    this.controller,
    this.suffixicon,
    required this.borderRadius,
    this.height,
    this.width,
    this.contentPadding,
    required this.onChanged,
  });

  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final Widget prefixIcon;
  final Widget hintText;
  final Widget? suffixicon;
  final BorderRadius borderRadius;
  final TextEditingController? controller;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? contentPadding;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 24,
      cursorErrorColor: AppColor.b,
      cursorColor: AppColor.b,
      style: TextStyle(fontSize: 12),
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      onChanged: onChanged,
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
    );
  }
}
