import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hk_shield/Common/mixins/validator.dart';

import '../App/data/models/form_model.dart';
import '../Common/enums.dart';
import 'controller_config.dart';

// TODO: ini mixin dipake buat apa?
// kalo ga kepake hapus aja
class FormConfig with ValidationMixin {
  List<FormModel> loginForm = [
    FormModel(
        formType: FormType.text,
        controller: ControllerConfig.usernameController,
        label: 'Username',
        hint: 'Username',
        icon: Icons.account_circle_outlined,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(errorText: "Username is required"),
        ])),
    FormModel(
      formType: FormType.password,
      controller: ControllerConfig.passwordController,
      label: 'Password',
      hint: 'Enter your password',
      icon: Icons.lock_outline,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: "Password is required"),
      ]),
    ),
  ];
}
