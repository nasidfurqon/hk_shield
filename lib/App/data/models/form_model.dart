import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hk_shield/Common/enums.dart';

import 'response_model.dart';

// TODO: Ini serius formmodelnya mau dibuat begini?
// Coba buat abstraksi yang lebih bagus, kalau bisa lihat contoh abstraksinya component view di native android
// masing2 input akan punya atributnya sendiri, kalau dijadiin satu gini bakal overwhelming
class FormModel {
  FormType formType;
  String? hint;
  String? label;
  String? valueField;
  String? textField;
  TextEditingController controller;
  IconData? icon;
  String? Function(String?)? validator;
  String? Function(DateTime?)? validatorDateTime;
  String? Function(dynamic)? validatorDynamic;
  bool obscureText;
  void Function(dynamic)? onChanged;
  List<dynamic>? dataDropdown;
  Future<ResponseModel>? futureDataDropdown;
  FileType? fileType;
  List<String>? allowedExtensions;
  DateTime? initDateValue;

  FormModel(
      {required this.formType,
      this.hint,
      this.label,
      this.valueField,
      this.textField,
      required this.controller,
      this.icon,
      this.obscureText = false,
      this.onChanged,
      this.dataDropdown,
      this.futureDataDropdown,
      this.validator,
      this.allowedExtensions,
      this.initDateValue,
      this.validatorDateTime,
      this.validatorDynamic,
      this.fileType});

  FormModel copyWith(
          {FormType? formType,
          String? hint,
          String? label,
          String? valueField,
          String? textField,
          TextEditingController? controller,
          IconData? icon,
          bool? obscureText,
          void Function(dynamic)? onChanged,
          List<dynamic>? dataDropdown,
          Future<ResponseModel>? futureDataDropdown,
          FileType? fileType,
          List<String>? allowedExtensions,
          String? Function(DateTime?)? validatorDateTime,
          String? Function(dynamic)? validatorDynamic}) =>
      FormModel(
        formType: formType ?? this.formType,
        hint: hint ?? this.hint,
        label: label ?? this.label,
        valueField: valueField ?? this.valueField,
        textField: textField ?? this.textField,
        controller: controller ?? this.controller,
        icon: icon ?? this.icon,
        obscureText: obscureText ?? this.obscureText,
        validator: validator ?? this.validator,
        onChanged: onChanged ?? this.onChanged,
        dataDropdown: dataDropdown ?? this.dataDropdown,
        futureDataDropdown: futureDataDropdown ?? this.futureDataDropdown,
        fileType: fileType ?? this.fileType,
        allowedExtensions: allowedExtensions ?? this.allowedExtensions,
        validatorDateTime: validatorDateTime ?? this.validatorDateTime,
        validatorDynamic: validatorDynamic ?? this.validatorDynamic,
      );

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        formType: json["formType"],
        hint: json["hint"],
        label: json["label"],
        valueField: json["valueField"],
        textField: json["textField"],
        controller: json["controller"],
        icon: json["icon"],
        obscureText: json["obscureText"],
        onChanged: json["onChanged"],
        dataDropdown: json["dataDropdown"],
        validator: json["validator"],
        futureDataDropdown: json["futureDataDropdown"],
        allowedExtensions: json["allowedExtensions"],
        fileType: json["fileType"],
      );

  Map<String, dynamic> toJson() => {
        "formType": formType,
        "hint": hint,
        "label": label,
        "valueField": valueField,
        "textField": textField,
        "controller": controller,
        "icon": icon,
        "validator": validator,
        "obscureText": obscureText,
        "onChanged": onChanged,
        "dataDropdown": dataDropdown,
        "futureDataDropdown": futureDataDropdown,
        "allowedExtensions": allowedExtensions,
        "fileType": fileType,
      };
}
