import 'package:flutter/material.dart';
import 'package:hk_shield/Common/Extensions/gaps_extension.dart';

class CustomText extends StatelessWidget {
  final String label;
  final String text;
  final bool? divider;
  const CustomText({super.key, required this.label, required this.text, this.divider});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        5.gH,
        Text(
            text
        ),
        5.gH,
        if(divider == true) Divider()
      ],
    );
  }
}
