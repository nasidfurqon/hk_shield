// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hk_shield/Common/Extensions/gaps_extension.dart';
import 'package:hk_shield/Common/Extensions/media_query_extension.dart';
import 'package:hk_shield/Common/Styles/color_scheme.dart';
import 'package:hk_shield/Common/Widget/Custom/custom_snackbar.dart';
import 'package:hk_shield/Common/Widget/Form/text_field.dart';
import 'package:hk_shield/App/data/models/form_model.dart'; // Import your form model

import '../../Bloc/form_bloc.dart';
import '../Enums/form_type.dart';
import '../Custom/custom_button.dart';

class HkFormBuilder extends StatelessWidget {
  final HKFormModel formModel;

  const HkFormBuilder({
    super.key,
    required this.formModel,
  });

  @override
  Widget build(BuildContext context) {
    final name = formModel.field;
    final type = formModel.formType;
    final modifier = formModel.modifier ?? FieldModifier(controller: TextEditingController());
    final props = formModel.props;

    print('NAME = $name, TYPE = $type, MODIFIER = $modifier, PROPS = $props');
    return FormBuilderField<String>(
      name: name,
      initialValue: modifier.controller?.text.isNotEmpty == true ? modifier.controller!.text : " ",
      validator: modifier.validator,
      builder: (FormFieldState field) {
        return InputDecorator(
          decoration: InputDecoration(
            errorText: field.errorText ?? '',
            labelText: props.label ?? "",
            prefixIcon: modifier.icon != null ? Icon(modifier.icon) : null,
            border: _getBorder(modifier.fieldType!),
          ),
          child: _buildFieldByType(type, field, modifier),
        );
      },
    );
  }

  Widget _buildFieldByType(FormType type, FormFieldState field, FieldModifier modifier) {
    switch (type) {
      case FormType.text:
        return TextFormField(
          controller: modifier.controller,
          onChanged: (value) {
            if (value.isNotEmpty) {
              field.didChange(value);
            }
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: field.value as String? ?? "",
          ),
        );
      case FormType.password:
        return TextFormField(
          controller: modifier.controller,
          onChanged: (value) {
            if (value.isNotEmpty) {
              field.didChange(value);
            }
          },
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText:field.value as String? ?? "",
          ),
        );
      default:
        return const SizedBox();
    }
  }

  InputBorder? _getBorder(FieldType fieldType) {
    switch (fieldType) {
      case FieldType.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        );
      case FieldType.filled:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        );
      default:
        return null;
    }
  }
}
class HKFormContainer extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final HKFormEvent Function(GlobalKey<FormBuilderState>)? formEvent;
  final List<HKFormModel> config;
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HKFormBloc(),
      child:
      BlocConsumer<HKFormBloc, HKFormState>(
        listener: (context, state) {
          if (state is HKFormSuccess) {
            HKToast.show('Success', state.message, context);
          } else if (state is HKFormFailure) {
            HKToast.show('Failed', state.error, context);
          }
        },
        builder: (context, state) {
          return Container(
            margin: widget.margin,
            padding: widget.padding,
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  ...widget.config.map((model) => HkFormBuilder(formModel: model)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}