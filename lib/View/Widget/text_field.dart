import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final bool? obscureText;
  final Icon? icon;
  final TextEditingController? controller;
  const CustomTextField({super.key, this.label, this.hint, this.obscureText, this.controller, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 30, right: 10),
            child: icon
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
                color: Colors.blue,
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
