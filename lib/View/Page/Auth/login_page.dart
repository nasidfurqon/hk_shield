import 'package:flutter/material.dart';
import 'package:hk_shield/View/Page/Home/home_page.dart';
import 'package:hk_shield/View/Widget/custom_auth_background.dart';
import 'package:hk_shield/View/Widget/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberUser = false;
  @override
  Widget build(BuildContext context) {
    // TODO 2: Abstraksi widget untuk base layout/page seperti ini sudah bagus namun masih terlalu spesifik
    // FIXME: Coba nantinya ubah menjadi lebih umum dan reusable
    return CustomAuthBackground(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          // TODO 3: Ini untuk inputnya belum dibuat dalam bentuk config
          // FIXME: Coba buat untuk input/form fieldnya dalam bentuk config seperti pada contoh repo yang sudah diberikan
          CustomTextField(
            label: "Username",
            hint: "Username",
            icon: Icon(
              Icons.account_circle_outlined,
              size: 30,
            ),
          ),
          // TODO 4
          // FIXME: apabila spacing antar widget sama pada widget column dan row bisa menggunakan atribut spacing saja agar lebih efisien
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            label: "Password",
            hint: "Password",
            icon: Icon(
              Icons.lock_outline,
              size: 30,
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 20,
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
                        setState(() {
                          rememberUser = value!;
                        });
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
          SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment(0.99, 1),
                      colors: <Color>[Color(0xff1749FA), Color(0xff0E2B94)]),
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
