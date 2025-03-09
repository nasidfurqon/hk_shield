import "package:flutter/material.dart";
import "package:hk_shield/Data/Models/dropdown_model.dart";
import "package:hk_shield/View/Page/Home/quick_menu.dart";
import "package:hk_shield/View/Widget/custom_carousel.dart";
import "package:hk_shield/View/Widget/custom_dropdown.dart";
import "package:hk_shield/View/Widget/custom_scaffold.dart";
import 'package:bootstrap_icons/bootstrap_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DropdownItem> coba = [DropdownItem(id: 1, label: 'khoi'), DropdownItem(id: 2, label: 'nasid')];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isLeading: false,
      icon2: BootstrapIcons.hand_index_thumb,
      children: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Image.asset('assets/bg_user.png',
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
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1
                                  )
                                ),
                                child: Padding(padding: EdgeInsets.all(6),
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/khoi.jpg',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),)
                              ),
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
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                        'Selamat Datang',
                                      style: TextStyle(color: Colors.white),

                                    ),
                                    Text(
                                        'Andung Damar',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18
                                      ),

                                    )
                                  ],
                                ),
                            )
                          ],
                        ),
                      )
                  )
                ]
              ),
            ),
            CustomCarousel(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDropdown(
                      hint: 'Divisi',
                      value: coba[0].id,
                      items: coba,
                      validatorLabel: 'input data'
                    ),
                    CustomDropdown(
                        hint: 'Proyek',
                        items: coba,
                        value: coba[0].id,
                        validatorLabel: 'input data'
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'QHSSE Report',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                    SizedBox(height: 10,),
                    QuickMenu()
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
