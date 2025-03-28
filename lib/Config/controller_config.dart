import 'package:flutter/material.dart';

// TODO: Ini jg kenapa controller dibuat diluar?
// incase akan banyak form dan butuh banyak controller, app bakal berat banget buat ngehandle controller yang gapada di dispose
// kalo dispose satu2 bakal makan banyak waktu
class ControllerConfig {
  static TextEditingController usernameController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
}
