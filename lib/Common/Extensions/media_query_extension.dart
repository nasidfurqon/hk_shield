import 'package:flutter/material.dart';

extension MediaQueryExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get viewInsetsBottom => MediaQuery.of(this).viewInsets.bottom;
}
