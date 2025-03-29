import 'package:flutter/cupertino.dart';
import 'package:hk_shield/App/modules/ProdukTidakSesuai/pts_page.dart';

import '../App/data/models/menu_model.dart';

class PageNameData {
  static final List<Widget> pages = [
    const Center(child: Text('Home Page')),
    const Center(child: Text('Knowledge Page')),
    const Center(child: Text('To Do List Page')),
    const Center(child: Text('My Action Page')),
    const Center(child: Text('Profile Page')),
  ];
}

// ini kalo data configan gni masukin ke folder feature/modulnya biar nyarinya ga susah [DONE]
