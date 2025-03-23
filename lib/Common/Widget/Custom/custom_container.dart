import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final double size;
  final FontWeight weight;
  final double padding;
  final double radius;
  final double? width;
  const CustomContainer({super.key, this.width,required this.title, required this.titleColor, required this.backgroundColor, required this.size, required this.weight, required this.padding, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius)
      ),
      child: Text(
        title,
        style: TextStyle(
          color: titleColor,
          fontSize: size,
          fontWeight: weight
        ),
      ),
    );
  }
}
