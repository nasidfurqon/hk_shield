import 'package:flutter/material.dart';
import 'package:hk_shield/View/Page/Auth/login_page.dart';

void main() {
  runApp(const MyApp());
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
