import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItemModel{
  final String label;
  final String image;
  final Widget? route;

  MenuItemModel({required this.label, required this.image, this.route});
}