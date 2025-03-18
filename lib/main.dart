import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'App/modules/Auth/Controller/action_controller.dart';
import 'App/modules/Auth/login_page.dart';

void main() {
  Get.put(AuthFormController());
  runApp(ScreenUtilInit(
    builder: (context, child) {
      return MaterialApp(
        home: MyApp(),
      );
    },
  ));
}

// TODO 0: Penamaan/struktur folder harap diperhatikan ya seperti pada contoh

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HK SHIELD',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
