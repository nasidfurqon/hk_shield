import '../../../data/models/menu_model.dart';
import '../../ProdukTidakSesuai/pts_page.dart';

class QuickMenuData {
  static List<MenuItemModel> generateMenu = [
    MenuItemModel(
        label: 'Dashboard',
        image: 'assets/dashboard.png',
        route: const ProdukTidakSesuaiPage()),
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
}
