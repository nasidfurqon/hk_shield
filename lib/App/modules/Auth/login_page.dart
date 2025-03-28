import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hk_shield/App/modules/Auth/Controller/action_controller.dart';
import 'package:hk_shield/App/modules/Home/home_page.dart';
import 'package:hk_shield/Common/Extensions/gaps_extension.dart';
import 'package:hk_shield/Common/Widget/Custom/custom_background.dart';
import 'package:hk_shield/Common/Widget/Form/text_field.dart';

class LoginPage extends GetView<AuthFormController> {
  LoginPage({Key? key}) : super(key: key);
  bool rememberUser = false;
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        imagePath: 'assets/background_auth.png',
        child: SingleChildScrollView(
          child: Column(
            children: [
              20.gH,
              // TODO 3: Ini untuk inputnya belum dibuat dalam bentuk config
              // FIXME: Coba buat untuk input/form fieldnya dalam bentuk config seperti pada contoh repo yang sudah diberikan
              CustomTextField(
                label: "Username",
                hint: "Username",
                icon: Icons.account_circle_outlined,
                size: 30,
              ),
              // TODO: kalo spacingnya sama make atribut spacing dari Column/Rownya aja
              20.gH,
              CustomTextField(
                label: "Password",
                hint: "Password",
                icon: Icons.lock_outline,
                size: 30,
                obscureText: true,
              ),
              20.gH,
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
                          activeColor: Color(0xff1749FA)),
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
                        color: Color(0xff1749FA),
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
              20.gH,
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
                            Color(0xff1749FA),
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
                  padding: EdgeInsets.only(top: 70),
                  child: Image.asset(
                    'assets/logoHK.png',
                  ))
            ],
          ),
        ));
  }
}
