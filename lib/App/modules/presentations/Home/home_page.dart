import 'package:bootstrap_icons/bootstrap_icons.dart';
import "package:flutter/material.dart";
import "package:hk_shield/App/data/models/dropdown_model.dart";
import "package:hk_shield/App/modules/presentations/Home/quick_menu.dart";
import "package:hk_shield/Common/Styles/color_scheme.dart";
import "package:hk_shield/Common/Widget/Form/custom_dropdown.dart";

import "../../../../Common/Widget/Custom/custom_carousel.dart";
import "../../../../Common/Widget/Custom/custom_scaffold.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DropdownItem> coba = [
    DropdownItem(id: 1, label: 'khoi'),
    DropdownItem(id: 2, label: 'nasid')
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isLeading: false,
      iconEnd: BootstrapIcons.hand_index_thumb,
      bottomNavBar: BottomNavigationBar(
        backgroundColor: HKColorScheme.primary,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          // TODO: ini diconfig aja
          BottomNavigationBarItem(
            icon: Icon(BootstrapIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(BootstrapIcons.book),
            label: 'Knowledge',
          ),
          BottomNavigationBarItem(
            icon: Icon(BootstrapIcons.card_checklist),
            label: 'To Do List',
          ),
          BottomNavigationBarItem(
            icon: Icon(BootstrapIcons.bell),
            label: 'My Action',
          ),
          BottomNavigationBarItem(
            icon: Icon(BootstrapIcons.person),
            label: 'Profile',
          ),
        ],
      ),
      children: SingleChildScrollView(
        child: Column(
          children: [
            // kalo isinya cuman child pake sizedbox aja jangan container [DONE]
            SizedBox(
              child: Stack(children: [
                Image.asset(
                  'assets/bg_user.png',
                  fit: BoxFit.cover,
                  height: 120,
                  width: double.infinity,
                ),
                SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 23),
                        child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/khoi.jpg',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kamis, 2 Agustus 2024',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Selamat Datang',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Andung Damar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
              ]),
            ),
            CustomCarousel(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // FIXME: Lihat TODO 3
                    CustomDropdown(
                        hint: 'Divisi',
                        value: coba[0].id,
                        items: coba,
                        isHome: true,
                        icon: BootstrapIcons.building,
                        validatorLabel: 'input data'),
                    // TODO: ini dropdown juga coba pake dummy api dari jsonplaceholder ya buat cobain fetching api ke dropdown
                    CustomDropdown(
                        hint: 'Proyek',
                        items: coba,
                        value: coba[0].id,
                        isHome: true,
                        icon: BootstrapIcons.building,
                        validatorLabel: 'input data'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'QHSSE Report',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    QuickMenu(),
                    SizedBox(
                      height: 30,
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
