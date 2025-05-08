import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:icons_plus/icons_plus.dart';

import '../App/data/models/form_model.dart';
import '../Common/Widget/Enums/form_type.dart';

// TODO: ini mixin dipake buat apa? [DONE]
// kalo ga kepake hapus aja
class LoginConfig {
  List<HKFormModel> loginForm = [
    HKFormModel(
        FormType.text,
        'email',
        FieldModifier(
            controller: TextEditingController(),
            icon: BootstrapIcons.person,
            fieldType: FieldType.outlined,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ])),
        FieldProps(
            label: 'Email',
            fieldType:  FieldType.filled)),
    HKFormModel(
        FormType.password,
        'password',
        FieldModifier(
            controller: TextEditingController(),
            icon: BootstrapIcons.lock,
            fieldType: FieldType.outlined,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.password(),
              FormBuilderValidators.required(),
            ])),
        FieldProps(
            label: 'Password',
            fieldType:  FieldType.filled))
  ];
}
