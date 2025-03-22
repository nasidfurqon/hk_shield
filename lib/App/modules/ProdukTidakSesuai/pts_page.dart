import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:hk_shield/App/data/models/pts_model.dart';
import 'package:hk_shield/App/modules/ProdukTidakSesuai/add_pts_page.dart';
import 'package:hk_shield/Common/Extensions/gaps_extension.dart';
import 'package:hk_shield/Common/Widget/Custom/custom_scaffold.dart';

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
            backgroundColor: Color(0xff224596),
            minimumSize: Size(double.infinity, 50)
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddProdukTidakSesuaiPage()));
          },
          child: Text(
              '+ Produk Tidak Sesuai',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white
            ),
          ),
        ),
      ),
      children: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 18),
        child: Column(
          children: [
            _buildListMenuButton(),
            20.gH,
            Column(
              children: _buildCard(),
            ),
          ],
        ),
      ),

    );
  }

  Widget _buildButton(String text, bool isActive){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: isActive ? Color(0xff224596) : Color(0xffF0F2FC),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: isActive? Colors.white : Colors.black
        ),
      )
    );
  }
  Widget _buildListMenuButton(){
    return Row(
      children: List.generate(label.length, (index){
        bool isActive = _selected == index;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: _buildButton(label[index], isActive),
        );
      })
    );
  }

  List<Widget> _buildCard(){
    List<Widget> listPts = [];
    for(final pts in PegawaiTidakSesuaiModel.buildPTSData){
      listPts.add(
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 0.5
            ),
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
                                pts['image'],
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
                              pts['Status'] ? Color(0xffFEB5B00): Color(0xff98D2C0),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      SafeArea(
                        child: Text(
                          _parseStatus(pts['Status']),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                          ),
                        )
                      ),
                    ],
                  ),
                  5.gH,
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Color(0xffF5F6FA),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text(
                      pts['Nomor'],
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
                    children: [
                      Text(
                        pts['Tanggal'],
                          style: TextStyle(
                            color: Colors.black26
                          ),
                      ),
                      7.gH,
                      Text(
                        pts['Nama'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      7.gH,
                      Text(
                        pts['Pekerjaan']
                      ),
                      7.gH,
                      Text(
                        pts['Penyebab'],
                        style: TextStyle(
                            color: Colors.black26
                        ),
                      )
                    ],
                  ),
                  6.gW,
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: pts['Status'] ? Color(0xffD3E671) : Color(0xffF37199),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    width: 52,
                    child: Text(
                      textAlign: TextAlign.center,
                      pts['Kriteria'],
                      style: TextStyle(
                        color: pts['Status']? Color(0xff0D4715) :  Color(0xffA31D1D)
                      ),
                    ),
                  )

                ],
              ),
            ],
          ),
        )
      );
      listPts.add(const SizedBox(height: 12,));
    }
    return listPts;
  }

  static String _parseStatus(bool status){
    if(status == true){
      return 'Proses';
    }
    else{
      return 'Close';
    }
  }
}
