import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// TODO: ubah jadi BLOC nanti ya modelnya BLOC kurleb nanti bkal kayak MVVM
class AuthFormController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void authLogin(GlobalKey<FormBuilderState> form) {
    Map<String, dynamic> data = {
      "username": form.currentState!.fields['username']!.value,
      "password": form.currentState!.fields['password']!.value,
    };
  }
}
