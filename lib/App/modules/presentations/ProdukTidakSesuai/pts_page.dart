import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:hk_shield/App/data/models/pts_model.dart';
import 'package:hk_shield/App/modules/presentations/ProdukTidakSesuai/detail_pts_page.dart';
import 'package:hk_shield/Common/Extensions/gaps_extension.dart';
import 'package:hk_shield/Common/Widget/Custom/custom_scaffold.dart';

import '../../../../Common/Styles/color_scheme.dart';
import 'add_pts_page.dart';

class ProdukTidakSesuaiPage extends StatefulWidget {
  const ProdukTidakSesuaiPage({super.key});

  @override
  State<ProdukTidakSesuaiPage> createState() => _ProdukTidakSesuaiPageState();
}

class _ProdukTidakSesuaiPageState extends State<ProdukTidakSesuaiPage> {
  List<String> label = ['Semua', 'Open', 'On Proses', 'Close'];
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Produk Tidak Sesuai",
      isLeading: true,
      iconStart: BootstrapIcons.funnel,
      iconEnd: BootstrapIcons.question_circle_fill,
      bottomNavBar: Container(
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: HKColorScheme.primary,
              minimumSize: Size(double.infinity, 50)),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddProdukTidakSesuaiPage()));
          },
          child: Text(
            '+ Produk Tidak Sesuai',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
      children: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 18),
        child: Column(
          children: [
            _buildListMenuButton(),
            20.gH,
            SizedBox(
              height: 530,
              child: ListView.separated(
                  itemBuilder: (context, index){
                    final pts = ProdukTidakSesuaiModel.buildPTSData[index];
                    return _buildPtsCard(context, pts, index);
                  },
                  separatorBuilder: (context, index) => 12.gH,
                  itemCount: ProdukTidakSesuaiModel.buildPTSData.length
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, bool isActive) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
            color: isActive ? HKColorScheme.primary : Color(0xffF0F2FC),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16, color: isActive ? Colors.white : Colors.black),
        ));
  }

  Widget _buildListMenuButton() {
    return Row(
        children: List.generate(label.length, (index) {
      bool isActive = _selected == index;
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: _buildButton(label[index], isActive),
      );
    }));
  }

  Widget _buildPtsCard(BuildContext context, dynamic pts, int index){
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailProdukTidakSesuai(
                  id: index,
                )));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Row(
          children: [
            Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(
                            pts['Image'] ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            pts['Status'] ?? ''
                                ? Color(0xffFEB5B00)
                                : Color(0xff98D2C0),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    SafeArea(
                        child: Text(
                          _parseStatus(pts['Status'] ?? ''),
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                  ],
                ),
                5.gH,
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Color(0xffF5F6FA),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    pts['Number'] ?? '',
                  ),
                )
              ],
            ),
            20.gW,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 7,
                  children: [
                    Text(
                      pts['Date'] ?? '',
                      style: TextStyle(color: Colors.black26),
                    ),
                    Text(
                      pts['Name'] ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(pts['Job'] ?? ''),
                    Text(
                      pts['Reason'] ?? '',
                      style: TextStyle(color: Colors.black26),
                    )
                  ],
                ),
                6.gW,
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: pts['Status'] ?? ''
                          ? Color(0xffD3E671)
                          : Color(0xffF37199),
                      borderRadius: BorderRadius.circular(5)),
                  width: 52,
                  child: Text(
                    textAlign: TextAlign.center,
                    pts['Criteria'] ?? '',
                    style: TextStyle(
                        color: pts['Status'] ?? ''
                            ? Color(0xff0D4715)
                            : Color(0xffA31D1D)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  static String _parseStatus(bool status) {
    if (status == true) {
      return 'Proses';
    } else {
      return 'Close';
    }
  }
}
