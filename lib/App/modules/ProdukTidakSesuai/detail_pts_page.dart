import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:hk_shield/App/data/models/pts_model.dart';
import 'package:hk_shield/App/modules/ProdukTidakSesuai/pts_page.dart';
import 'package:hk_shield/Common/Extensions/gaps_extension.dart';
import 'package:hk_shield/Common/Widget/Custom/custom_container.dart';
import 'package:hk_shield/Common/Widget/Custom/custom_scaffold.dart';
import 'package:hk_shield/Common/Widget/Custom/custom_text.dart';

import '../../../Common/Styles/color_scheme.dart';

class DetailProdukTidakSesuai extends StatefulWidget {
  final int id;
  const DetailProdukTidakSesuai({super.key, required this.id});
  @override
  State<DetailProdukTidakSesuai> createState() => _DetailProdukTidakSesuaiState();
}

class _DetailProdukTidakSesuaiState extends State<DetailProdukTidakSesuai> {
  late Map<String, dynamic> produk;

  @override
  void initState() {
    super.initState();
    print("ID: ${widget.id}");
    produk = ProdukTidakSesuaiModel.buildPTSData[widget.id];
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Detail PTS',
      bottomNavBar: Container(
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: HKColorScheme.primary,
              minimumSize: Size(double.infinity, 50)
            ),
            child: Text(
              'Lengkapi Disposisi Laporan',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white
              ),
            )
        ),
      ),
      children: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(produk['Image'], fit: BoxFit.cover,),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomContainer(
                        title: 'Saat Terjadi Insiden',
                        titleColor: Colors.white,
                        backgroundColor:Color(0xff2626264D) ,
                        size: 14,
                        weight: FontWeight.bold,
                        padding: 5,
                        radius: 20
                    )
                  )
                ),
              ],
            ),
            15.gH,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomContainer(
                      title: 'Tanggal Pemeriksaan ${produk['Date']}',
                      titleColor: HKColorScheme.primary,
                      backgroundColor: Color(0xffF0F2FC),
                      size: 16,
                      weight: FontWeight.bold,
                      padding: 10,
                      radius: 10
                  ),
                  10.gH,
                  Row(
                    children: [
                      CustomContainer(
                          title: '${produk['Criteria']}',
                          titleColor: produk['Status']? Color(0xff0D4715) :  Color(0xffA31D1D),
                          backgroundColor: produk['Status'] ? Color(0xffD3E671) : Color(0xffF37199),
                          size: 12,
                          weight: FontWeight.bold,
                          padding: 5,
                          radius: 10
                      ),
                      5.gW,
                      CustomContainer(
                          title: 'Open',
                          titleColor: Colors.white,
                          backgroundColor: Colors.red,
                          size: 12,
                          weight: FontWeight.bold,
                          padding: 5,
                          radius: 10
                      ),
                    ],
                  ),
                  15.gH,
                  Text(
                    produk['Date'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  10.gH,
                  Row(
                    children: [
                      Icon(
                        BootstrapIcons.geo_alt_fill
                      ),
                      Text(
                        produk['City'],
                        style: TextStyle(
                          fontSize: 14
                        ),
                      )
                    ],
                  ),
                  20.gH,
                  // kalau yg reptisi gni bikin configan aja nanti map ke widget
                  CustomText(label: 'Description', text: produk['Description'], divider: true,),
                  10.gH,
                  CustomText(label: 'Jenis Pekerjaan', text: produk['Type'], divider: true,),
                  10.gH,
                  CustomText(label: 'Item Pekerjaan', text: produk['Item'], divider: true,),
                  10.gH,
                  CustomText(label: 'Reason', text: produk['Reason']),
                ],
              ),
            ),
            10.gH,
            Container(
              decoration: BoxDecoration(
                color: Color(0xffF5F6FA)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: CustomContainer(
                      title: 'LOG AKTIVITAS',
                      titleColor: HKColorScheme.primary,
                      backgroundColor: Color(0xffF0F2FC),
                      size: 16,
                      weight: FontWeight.bold,
                      padding: 10,
                      radius:0,
                      width: double.infinity ,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dilaporkan Oleh'),
                          15.gH,
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Color(0xffF0F2FC),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.asset(
                                      'assets/pelapor_image.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Bertrand,',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text(
                                            ' User Proyek',
                                          )
                                        ],
                                      ),
                                      10.gH,
                                      Text(
                                        'Sabtu, 29 Mei 2024 12:30',
                                        style: TextStyle(
                                          color: Colors.black26
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
