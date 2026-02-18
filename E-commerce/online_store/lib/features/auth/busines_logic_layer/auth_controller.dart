import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_store/core/routing/routing_manager.dart';
import 'package:online_store/features/auth/data_layer/service/authservice.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isobscure = false.obs;

  final Authservice _authService = Authservice();

  Future<void> login(String phone) async {
    try {
      isLoading.value = true;
      bool success = await _authService.login(phone: phone);
      if (success) {
        isLoading.value = false;
        Get.snackbar(
          'Login successfuly',
          'Welcome!',
          // ignore: deprecated_member_use
          backgroundColor: Color(0xFF44C838).withOpacity(0.5),
        );
        Get.offNamed(RoutingManager.otpScr, arguments: phone);
      } else {}
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Login Failed',
        e.toString(),
        // ignore: deprecated_member_use
        backgroundColor: Color(0XFFCF362E).withOpacity(0.5),
      );

      Get.snackbar(
        'Login Failed',
        e.toString(),
        // ignore: deprecated_member_use
        backgroundColor: Color(0XFFCF362E).withOpacity(0.5),
      );
    }
  }

  Future<void> otp(String phone, String code) async {
    try {
      isLoading.value = true;
      bool success = await _authService.otp(phone: phone, code: code);
      if (success) {
        isLoading.value = false;
        Get.snackbar(
          'Login successfuly',
          'Welcome!',
          // ignore: deprecated_member_use
          backgroundColor: Color(0xFF44C838).withOpacity(0.5),
        );
        Get.offNamed(RoutingManager.superHomeScr);
      } else {}
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Login Failed',
        e.toString(),
        // ignore: deprecated_member_use
        backgroundColor: Color(0XFFCF362E).withOpacity(0.5),
      );
    }
  }

  Future<void> signup(String phone, String name, String email) async {
    try {
      isLoading.value = true;
      bool success = await _authService.signup(
        name: name,
        phone: phone,
        email: email,
      );
      if (success) {
        isLoading.value = false;
        Get.snackbar(
          'Your information accepted',
          'you will resive a code message',
          // ignore: deprecated_member_use
          backgroundColor: Color(0xFF44C838).withOpacity(0.5),
        );
        Get.offAllNamed(RoutingManager.otpScr, arguments: phone);
      } else {}
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Signup Failed',
        e.toString(),
        // ignore: deprecated_member_use
        backgroundColor: Color(0XFFCF362E).withOpacity(0.5),
      );
    }
  }

  FormFieldValidator<String> phoneValidator() {
    return (value) {
      if (value == null) {
        return 'Please fill out this field';
      } else if (value.length != 10) {
        return 'Phone number must be 10 digits';
      } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
        return 'Only digits are allowed';
      } else if (!value.startsWith('09')) {
        return 'Phone number must start with 09';
      }
      return null;
    };
  }

  FormFieldValidator<String> requiredFieldValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Please fill out this field';
      }
      return null;
    };
  }

  FormFieldValidator<String> emailValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Please fill out this field';
      }
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

      if (!emailRegex.hasMatch(value)) {
        return 'Email is invalid';
      }
      return null;
    };
  }
}
