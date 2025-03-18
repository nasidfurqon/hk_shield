// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hk_shield/Common/Extensions/gaps_extension.dart';
import 'package:hk_shield/Common/Styles/color_scheme.dart';
import 'package:hk_shield/Common/Widget/Custom/custom_snackbar.dart';
import 'package:hk_shield/Common/Widget/Form/text_field.dart';
import 'package:hk_shield/Common/mixins/validator.dart';
import 'package:get/get.dart';
import '../../../App/data/models/response_model.dart';
import '../../enums.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../Custom/custom_button.dart';

class HkFormBuilder extends StatelessWidget {
  final FormType? formType;
  final String? hint;
  final String? label;
  final String? textField;
  final IconData? icon;
  final bool? obscureText;
  const HkFormBuilder(
      {super.key,
        this.hint,
        this.label,
        this.textField,
        this.icon,
        this.obscureText,
        this.formType,});

  @override
  Widget build(BuildContext context) {
    if (formType == FormType.text) {
      return CustomTextField(
          hint: hint,
          label: label,
          icon: icon);
    } else if (formType == FormType.password) {
      return CustomTextField(
        hint: hint,
        label: label,
        obscureText: obscureText,
        icon: icon,
      );
    }
    else {
      return const SizedBox();
    }
  }
}

class HKFormContainer extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final FormAction action;
  final void Function(GlobalKey<FormBuilderState>)? onCreate;
  final void Function(GlobalKey<FormBuilderState>)? onUpdate;
  final void Function(GlobalKey<FormBuilderState>)? onRead;
  final List<dynamic> config;
  final String buttonText;
  final IconData? icon;
  const HKFormContainer({
    super.key,
    this.margin,
    this.padding,
    required this.action,
    this.onCreate,
    this.onUpdate,
    this.onRead,
    required this.config,
    required this.buttonText,
    this.icon,
  });

  @override
  State<HKFormContainer> createState() => _HKFormContainerState();
}

class _HKFormContainerState extends State<HKFormContainer>
    with ValidationMixin {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      margin: widget.margin,
      padding: widget.padding,
      child: FormBuilder(
        key: _formKey,
        child: Column(children: [
          ...widget.config.map((e) => HkFormBuilder(
            formType: e.formType,
            hint: e.hint,
            icon: e.icon,
            label: e.label,
            obscureText: e.obscureText
          )),
          RsButton(
              radius: 12.w,
              width: Get.width,
              buttonColor: HKColorScheme.primary,
              splashColor: HKColorScheme.secondary,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.buttonText,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 14.sp,
                        )),
                    10.gW,
                    Icon(
                      widget.icon,
                      color: Colors.white,
                    )
                  ]),
              onTap: () {
                if (_formKey.currentState != null && _formKey.currentState!.saveAndValidate()) {
                  print("FORM VALID");
                  if (widget.action == FormAction.create) {
                    widget.onCreate!(_formKey);
                  } else if (widget.action == FormAction.update) {
                    widget.onUpdate!(_formKey);
                  } else if (widget.action == FormAction.read) {
                    widget.onRead!(_formKey);
                  }
                } else {
                  HKToast.show(
                      'Warning ⚠️', 'There are some invalid fields');
                }
              })
        ]),
      ),
    ));
  }
}
