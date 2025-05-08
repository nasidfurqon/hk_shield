import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hk_shield/Common/Widget/Enums/form_type.dart';

import 'response_model.dart';

// TODO: Ini serius HKFormModelnya mau dibuat begini? [DONE]
// Coba buat abstraksi yang lebih bagus, kalau bisa lihat contoh abstraksinya component view di native android
// masing2 input akan punya atributnya sendiri, kalau dijadiin satu gini bakal overwhelming
class HKFormModel {
  final FormType formType;
  final String field;
  final FieldModifier? modifier;
  final FieldProps props;

  HKFormModel(this.formType, this.field, this.modifier, this.props,);
}

class FieldModifier{
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final IconData? icon;
  final bool? obscureText;
  final FieldType? fieldType;
  final void Function(dynamic)? onChanged;
  final void Function(dynamic)? onSuccess;
  final double? marginBottom;

  FieldModifier({
    this.fieldType,
    this.validator,
    TextEditingController? controller,
    this.icon,
    this.obscureText,
    this.onChanged,
    this.marginBottom,
    this.onSuccess,
  }): controller = controller ?? TextEditingController();
}

class FieldProps {
  final double? width;
  final double? height;
  final String? hint;
  final String? label;
  final FileType? fileType;
  final String? getAPI;
  final String? description;
  final List<String>? fields;
  final FieldType? fieldType;
  final String? initialValue;
  final int? maxLines;
  final bool? required;

  FieldProps({
    this.width,
    this.height,
    this.hint,
    this.label,
    this.fileType,
    this.initialValue,
    this.getAPI,
    this.fields,
    this.maxLines,
    this.fieldType,
    this.description,
    this.required,
  });
}
