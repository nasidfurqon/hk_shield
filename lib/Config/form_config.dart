import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hk_shield/Common/mixins/validator.dart';

import '../App/data/models/form_model.dart';
import '../Common/Widget/Enums/form_type.dart';
import 'controller_config.dart';

// TODO: ini mixin dipake buat apa? [DONE]
// kalo ga kepake hapus aja
class LoginConfig {
  List<HKFormModel> loginForm = [
    HKFormModel(
        FormType.text,
        'email',
        FieldModifier(
            controller: TextEditingController(),
            icon: Icons.account_circle,
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
            icon: Icons.account_circle,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.password(),
              FormBuilderValidators.required(),
            ])),
        FieldProps(
            label: 'Password',
            fieldType:  FieldType.filled))
  ];
}
