import 'package:flutter/material.dart';

class CustomAuthBackground extends StatefulWidget {
  final Widget? child;
  const CustomAuthBackground({super.key, this.child});

  @override
  State<CustomAuthBackground> createState() => _CustomAuthBackgroundState();
}

class _CustomAuthBackgroundState extends State<CustomAuthBackground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/background_auth.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          SafeArea(
            // child: Padding(
            //   padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              margin: EdgeInsets.only(
                  // TODO 1: ini MediaQuery better dibuat extension function dari BuildContext, karena akan sering dipaka
                  // EXAMPLE: context.screenWidth
                  // REF: https://dart.dev/language/extension-methods
                  top: MediaQuery.of(context).size.height * 0.35,
                  left: 30,
                  right: 30),
              child: widget.child,
            ),
            // ),
          )
        ],
      ),
    );
  }
}
