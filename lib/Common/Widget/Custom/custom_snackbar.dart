import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../styles/color_scheme.dart';

class HKToast {
  final String title;
  final String message;

  const HKToast({
    required this.title,
    required this.message,
  });

  static show(String title, String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Column(
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          Text(message)
        ],
      ))
    );
  }
}
