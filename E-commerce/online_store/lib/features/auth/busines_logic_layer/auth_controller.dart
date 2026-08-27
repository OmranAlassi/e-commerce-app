import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_store/core/network/api_error.dart';
import 'package:online_store/core/routing/routing_manager.dart';
import 'package:online_store/features/auth/data_layer/service/authservice.dart';

class AuthController extends GetxController {
  GetStorage box = GetStorage();
  RxBool isLoading = false.obs;
  RxBool isobscure = false.obs;

  final Authservice _authService = Authservice();

  Future<void> login(String phone) async {
    try {
      isLoading.value = true;
      bool success = await _authService.login(phone: phone);
      if (success) {
        Get.snackbar(
          'Login successfuly',
          'Welcome!',
          // ignore: deprecated_member_use
          backgroundColor: Color(0xFF44C838).withOpacity(0.5),
        );
        Get.offNamed(RoutingManager.otpScr, arguments: phone);
      } else {
        Get.snackbar(
          'Login Failed',
          'Please try again',
          // ignore: deprecated_member_use
          backgroundColor: Color(0XFFCF362E).withOpacity(0.5),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Login Failed',
        ApiError.from(e, logoutOn401: false),
        // ignore: deprecated_member_use
        backgroundColor: Color(0XFFCF362E).withOpacity(0.5),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> otp(String phone, String code) async {
    try {
      isLoading.value = true;
      bool success = await _authService.otp(phone: phone, code: code);
      if (success) {
        Get.snackbar(
          'Login successfuly',
          'Welcome!',
          // ignore: deprecated_member_use
          backgroundColor: Color(0xFF44C838).withOpacity(0.5),
        );
        Get.offNamed(RoutingManager.superHomeScr);
      } else {
        Get.snackbar(
          'Login Failed',
          'Invalid code, please try again',
          // ignore: deprecated_member_use
          backgroundColor: Color(0XFFCF362E).withOpacity(0.5),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Login Failed',
        ApiError.from(e, logoutOn401: false),
        // ignore: deprecated_member_use
        backgroundColor: Color(0XFFCF362E).withOpacity(0.5),
      );
    } finally {
      isLoading.value = false;
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
        Get.snackbar(
          'Your information accepted',
          'you will resive a code message',
          // ignore: deprecated_member_use
          backgroundColor: Color(0xFF44C838).withOpacity(0.5),
        );
        Get.offAllNamed(RoutingManager.otpScr, arguments: phone);
      } else {
        Get.snackbar(
          'Signup Failed',
          'Please try again',
          // ignore: deprecated_member_use
          backgroundColor: Color(0XFFCF362E).withOpacity(0.5),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Signup Failed',
        ApiError.from(e, logoutOn401: false),
        // ignore: deprecated_member_use
        backgroundColor: Color(0XFFCF362E).withOpacity(0.5),
      );
    } finally {
      isLoading.value = false;
    }
  }

  FormFieldValidator<String> phoneValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
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
