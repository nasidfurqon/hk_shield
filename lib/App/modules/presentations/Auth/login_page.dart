import 'package:flutter/material.dart';
import 'package:hk_shield/Common/Extensions/gaps_extension.dart';
import 'package:hk_shield/Common/Widget/Custom/custom_background.dart';
import 'package:hk_shield/Common/Widget/Form/text_field.dart';
import 'package:hk_shield/Config/form_config.dart';

import '../../../../Common/Bloc/form_bloc.dart';
import '../../../../Common/Styles/color_scheme.dart';
import '../../../../Common/Widget/Form/form_builder.dart';
import '../Home/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        imagePath: 'assets/background_auth.png',
        child: Column(
          // TODO: Kayak gini buat spacing lebih konsisten, spacing extension dipake kalo spacingnya beda2[DONE]
          spacing: 20,
          children: [
            // TODO 3: Ini untuk inputnya belum dibuat dalam bentuk config
            // FIXME: Coba buat untuk input/form fieldnya dalam bentuk config seperti pada contoh repo yang sudah diberikan
            HKFormContainer(
              margin: EdgeInsets.symmetric(horizontal: 20),
              config: LoginConfig().loginForm,
              buttonText: "Login",
              icon: Icons.login,
              formEvent: (formKey) => CreateHKFormEvent(formKey),
            ),
            Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Checkbox(
                        value: rememberUser,
                        onChanged: (bool? value) {
                          // TODO 6: Ini bisa menggunakan state management agar lebih efisien
                          // FIXME: Consider untuk coba state management BLoC
                          // setState(() {
                          //   rememberUser = value!;
                          // });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        activeColor: HKColorScheme.primary),
                    Text(
                      "Ingat saya",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                )),
                Text(
                  'Lupa Password?',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: HKColorScheme.primary,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
            GestureDetector(
                onTap: () {
                  // TODO: ini juga nanti diganti pake routing management sendiri kayak autoroute atau go route
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment(0.99, 1),
                        colors: <Color>[
                          HKColorScheme.primary,
                          Color(0xff0E2B94)
                        ]),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Masuk",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 40),
                child: Image.asset(
                  'assets/logoHK.png',
                ))
          ],
        ));
  }
}
