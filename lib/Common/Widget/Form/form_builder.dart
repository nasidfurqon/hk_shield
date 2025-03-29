// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hk_shield/Common/Extensions/gaps_extension.dart';
import 'package:hk_shield/Common/Styles/color_scheme.dart';
import 'package:hk_shield/Common/Widget/Custom/custom_snackbar.dart';
import 'package:hk_shield/Common/Widget/Form/text_field.dart';

import '../../Bloc/form_bloc.dart';
import '../Enums/form_type.dart';
import '../Custom/custom_button.dart';

class HkFormBuilder extends StatelessWidget {
  final FormType? formType;
  final String? hint;
  final String? label;
  final String? textField;
  final IconData? icon;
  final bool? obscureText;
  const HkFormBuilder({
    super.key,
    this.hint,
    this.label,
    this.textField,
    this.icon,
    this.obscureText,
    this.formType,
  });

  @override
  Widget build(BuildContext context) {
    if (formType == FormType.text) {
      return CustomTextField(hint: hint, label: label, icon: icon);
    } else if (formType == FormType.password) {
      return CustomTextField(
        hint: hint,
        label: label,
        obscureText: obscureText,
        icon: icon,
      );
    } else {
      return const SizedBox();
    }
  }
}

class HKFormContainer extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final HKFormEvent Function(GlobalKey<FormBuilderState>)? formEvent;
  final List<dynamic> config;
  final String buttonText;
  final IconData? icon;
  const HKFormContainer({
    super.key,
    this.margin,
    this.padding,
    this.formEvent,
    required this.config,
    required this.buttonText,
    this.icon,
  });

  @override
  State<HKFormContainer> createState() => _HKFormContainerState();
}

class _HKFormContainerState extends State<HKFormContainer> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  Map<String, TextEditingController> controllers = {};
  final loadingState = false.obs;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HKFormBloc(),
      child: BlocConsumer<HKFormBloc, HKFormState>(
        listener: (context, state) {
          if (state is HKFormLoading) {
            loadingState.value = true;
          } else {
            loadingState.value = false;

            if (state is HKFormSuccess) {
              HKToast.show('Success', state.message);
            } else if (state is HKFormFailure) {
              HKToast.show('Error', state.error);
            }
          }
        },
        builder: (context, state) {
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
                    obscureText: e.obscureText)),
                RsButton(
                    radius: 12.w,
                    width: Get.width,
                    buttonColor: HKColorScheme.primary,
                    splashColor: HKColorScheme.secondary,
                    child: loadingState.value
                        ? CircularProgressIndicator(color: Colors.white)
                        : Row(
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
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.saveAndValidate()) {
                        if (widget.formEvent != null) {
                          final formEvent = widget.formEvent!(_formKey);
                          context.read<HKFormBloc>().add(formEvent);
                        }
                      } else {
                        HKToast.show(
                            'Warning', 'There are some invalid fields');
                      }
                    })
              ]),
            ),
          ));
        },
      ),
    );
  }
}