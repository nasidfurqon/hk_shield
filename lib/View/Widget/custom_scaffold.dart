import "package:flutter/material.dart";
import "package:bootstrap_icons/bootstrap_icons.dart";

class CustomScaffold extends StatelessWidget {
  final bool? isLeading;
  final IconData? icon1;
  final IconData? icon2;
  final Widget? children;
  const CustomScaffold({super.key, this.isLeading, this.icon1, this.icon2, this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff224596),
        automaticallyImplyLeading: isLeading ?? true,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Padding(
          padding: EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('data', style: TextStyle(color : Colors.white),),
              Row(
                children: [
                  Icon(icon1, size: 30,),
                  SizedBox(width: 10,),
                  Icon(icon2, size: 30,)
                ],
              )
            ],
          ),
        ),
      ),
      body: children,
    );
  }
}
