import 'package:flutter/material.dart';
import 'package:hk_shield/Common/Extensions/gaps_extension.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final bool? obscureText;
  final IconData? icon;
  final double? size;
  final TextEditingController? controller;
  const CustomTextField({super.key, this.label, this.hint, this.obscureText, this.controller, this.icon, this.size});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 30, right: 10),
            child: Icon(
              icon,
              size: size,
            )
          ),
          labelText: label,
          labelStyle: TextStyle(
              color: Colors.black38
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20
          ),
          hintText:hint,
          hintStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w400
          ),
          border: OutlineInputBorder(
              borderSide:BorderSide(
                color: Colors.black12,
              ),
              borderRadius:BorderRadius.circular(50)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black12
              ),
              borderRadius: BorderRadius.circular(50)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide:BorderSide(
                  color: Colors.black12
              ),
              borderRadius: BorderRadius.circular(50)
          ),
          filled: true,
          fillColor: Colors.white,

      ),
    );
  }
}

class CustomTextFieldWithLabel extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  const CustomTextFieldWithLabel({super.key, required this.controller, required this.label, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        4.gH,
        TextField(
          controller: controller,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}

