import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hk_shield/App/data/models/pts_model.dart';
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
      children: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 18),
        child: Column(
          children: [
            _buildListMenuButton(),
            Column(
              children: _buildCard(),
            )
          ],
        ),
      )
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
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Row(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(pts['image']),
                      SafeArea(
                          child: Text(_parseStatus(pts['Status']))
                      )
                    ],
                  )
                ],
              ),
              Column()
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
