import "package:flutter/material.dart";
import "package:bootstrap_icons/bootstrap_icons.dart";

class CustomScaffold extends StatelessWidget {
  final String? title;
  final bool? isLeading;
  final IconData? iconStart;
  final IconData? iconEnd;
  final Widget? children;
  final Widget? bottomNavBar;
  const CustomScaffold({super.key, this.isLeading, this.iconStart, this.iconEnd, this.children, this.title, this.bottomNavBar});

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
              Text(title ?? '', style: TextStyle(color : Colors.white),),
              Row(
                children: [
                  Icon(iconStart, size: 30,),
                  SizedBox(width: 10,),
                  Icon(iconEnd, size: 30,)
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavBar,
      body: children,
    );
  }
}
