import 'package:flutter/material.dart';
import 'package:hk_shield/Common/Extensions/media_query_extension.dart';

class CustomBackground extends StatefulWidget {
  final Widget? child;
  final String imagePath;
  const CustomBackground({super.key, this.child,required this.imagePath});

  @override
  State<CustomBackground> createState() => _CustomBackground();
}

class _CustomBackground extends State<CustomBackground> {
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
            widget.imagePath,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          SafeArea(
            // child: Padding(
            //   padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              margin: EdgeInsets.only(
                  // TODO 1: ini MediaQuery better dibuat extension function dari BuildContext, karena akan sering dipaka (DONE)
                  // EXAMPLE: context.screenWidth
                  // REF: https://dart.dev/language/extension-methods
                  top: context.screenHeight * 0.35,
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
