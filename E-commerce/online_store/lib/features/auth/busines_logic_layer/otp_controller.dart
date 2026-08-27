import 'dart:async';
import 'dart:ui';
import 'package:get/get.dart' hide Trans;
import 'package:online_store/core/network/api_error.dart';
import 'package:online_store/features/auth/data_layer/service/authservice.dart';

class OtpController extends GetxController {
  RxInt seconds = 60.obs;
  final Authservice _authService = Authservice();
  RxBool isLoading = false.obs;
  RxBool canResend = false.obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    canResend.value = false;
    seconds.value = 60;
    timer?.cancel();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds.value == 0) {
        timer.cancel();
        canResend.value = true;
      } else {
        seconds.value--;
      }
    });
  }

  String get timeText {
    final s = seconds.value;
    final m = (s ~/ 60).toString().padLeft(2, '0');
    final sec = (s % 60).toString().padLeft(2, '0');
    return '$m:$sec';
  }

  Future<void> resendCode(String phoneNumber) async {
    if (!canResend.value) return;
    try {
      isLoading.value = true;
      await _authService.login(phone: phoneNumber);
      startTimer();
      Get.snackbar(
        'Code sent',
        'A new code has been sent to your phone',
        // ignore: deprecated_member_use
        backgroundColor: Color(0xFF44C838).withOpacity(0.5),
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        ApiError.from(e, logoutOn401: false),
        // ignore: deprecated_member_use
        backgroundColor: Color(0XFFCF362E).withOpacity(0.5),
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
