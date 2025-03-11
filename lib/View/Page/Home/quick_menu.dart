import 'package:flutter/material.dart';
import 'package:hk_shield/Data/Models/menu_model.dart';

class QuickMenu extends StatefulWidget {
  const QuickMenu({super.key});

  @override
  State<QuickMenu> createState() => _QuickMenuState();
}

class _QuickMenuState extends State<QuickMenu> {
  // TODO 5: static data/config seperti ini lebih baik disimpan pada file terpisah, dalam file datasource atau config
  List<MenuItemModel> generateMenu = [
    MenuItemModel(
        label: 'Dashboard', image: 'assets/dashboard.png', route: null),
    MenuItemModel(
        label: 'Quality\nInspection',
        image: 'assets/quality_inspection.png',
        route: null),
    MenuItemModel(
        label: 'HSSE\nPatrol', image: 'assets/hsse_patrol.png', route: null),
    MenuItemModel(
        label: 'QHSSE\nCommunication',
        image: 'assets/qhsse_communication.png',
        route: null),
    MenuItemModel(
        label: 'Enviromental\nReport',
        image: 'assets/enviromental_report.png',
        route: null),
    MenuItemModel(
        label: 'Fit To Work', image: 'assets/fit_to_work_1.png', route: null),
    MenuItemModel(
        label: 'Work\nPermit', image: 'assets/work_permit.png', route: null),
    MenuItemModel(label: 'RTM', image: 'assets/rtm.png', route: null),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 30,
        runSpacing: 15,
        alignment: WrapAlignment.center,
        children: generateMenu.map((item) => _buildMenu(item)).toList(),
      ),
    );
  }

  Widget _buildMenu(MenuItemModel item) {
    return SizedBox(
      // FIXME: lihat pada TODO 1
      width: MediaQuery.of(context).size.width / 7,
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Stack(children: [
            Image.asset('assets/bg_menu.png'),
            SafeArea(
                child: Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Image.asset(
                item.image,
                width: 40,
              ),
            ))
          ]),
          // FIXME: lihat pada TODO 4

          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              item.label,
              textAlign: TextAlign.center,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.visible,
              style: const TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
