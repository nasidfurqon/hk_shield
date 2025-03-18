import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../styles/color_scheme.dart';

class HKToast {
  final String title;
  final String message;

  const HKToast({
    required this.title,
    required this.message,
  });

  static show(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      maxWidth: Get.width - 48.w,
      margin: EdgeInsets.only(top: 24.w),
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
      backgroundColor: Colors.white,
      borderWidth: 1.w,
      borderColor: HKColorScheme.primary,
      colorText: HKColorScheme.text,
      icon: SizedBox(
        width: 40.w,
        height: 40.w,
      ),
    );
  }
}
