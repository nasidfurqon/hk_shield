import 'package:flutter/material.dart';
import 'package:hk_shield/App/data/models/menu_model.dart';
import 'package:hk_shield/Common/Extensions/gaps_extension.dart';
import 'package:hk_shield/Common/Extensions/media_query_extension.dart';

import '../../../Config/main_config.dart';

class QuickMenu extends StatefulWidget {
  const QuickMenu({super.key});

  @override
  State<QuickMenu> createState() => _QuickMenuState();
}

class _QuickMenuState extends State<QuickMenu> {
  // TODO 5: static data/config seperti ini lebih baik disimpan pada file terpisah, dalam file datasource atau config (DONE)
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 30,
        runSpacing: 15,
        alignment: WrapAlignment.center,
        children: QuickMenuData.generateMenu.map((item) =>
            BuildMenu(
              label: item.label,
              image: item.image,
              route: item.route,
            )).toList(),
      ),
    );
  }


}

class BuildMenu extends StatelessWidget{
  final String label;
  final String image;
  final Widget? route;

  const BuildMenu({
    Key? key,
    required this.label,
    required this.image,
    this.route,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(route != null){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return route!;
          }));
        }
      },
      child: SizedBox(
        // FIXME: lihat pada TODO 1 (DONE)
        width: context.screenWidth / 7,
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
                      image,
                      width: 40,
                    ),
                  ))
            ]),
            // FIXME: lihat pada TODO 4 (DONE)
            5.gH,
            SizedBox(
              width: double.infinity,
              child: Text(
                label,
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.visible,
                style: const TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }


}