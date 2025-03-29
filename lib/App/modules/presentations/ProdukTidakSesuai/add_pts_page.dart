import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:hk_shield/Common/Extensions/gaps_extension.dart';
import 'package:hk_shield/Common/Widget/Custom/custom_scaffold.dart';
import 'package:hk_shield/Common/Widget/Form/custom_dropdown.dart';
import 'package:hk_shield/Common/Widget/Form/custom_imagePicker.dart';
import 'package:hk_shield/Common/Widget/Form/custom_radioButton.dart';
import 'package:hk_shield/Common/Widget/Form/text_field.dart';

import '../../../data/models/dropdown_model.dart';
class AddProdukTidakSesuaiPage extends StatefulWidget {
  const AddProdukTidakSesuaiPage({super.key});

  @override
  State<AddProdukTidakSesuaiPage> createState() =>
      _AddProdukTidakSesuaiPageState();
}

class _AddProdukTidakSesuaiPageState extends State<AddProdukTidakSesuaiPage> {
  List<DropdownItem> listItems = [
    DropdownItem(id: 1, label: 'khoi'),
    DropdownItem(id: 2, label: 'nasid')
  ];

  // TODO: ini jg sama ya, kalo belum sempet make api dari server dev make dummy dari jsonplaceholder aja

  final List<String> listopsi = ['opsi 1', 'opsi 2', 'opsi 3', 'opsi 4'];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Tambah Produk Tidak Sesuai',
      iconEnd: BootstrapIcons.question_circle_fill,
      bottomNavBar: Container(
        color: Colors.transparent,
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff224596),
              minimumSize: Size(double.infinity, 50)),
          onPressed: () {},
          child: Text(
            'Simpan',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
      children: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xffF0F2FC)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Divisi Sipil Umum',
                    ),
                    Text(
                      'Proyek Tol IKN 3A',
                      style: TextStyle(
                          color: Color(0xff224596),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              15.gH,
              // TODO:  Ini bikin configan
              CustomDropdown(
                  label: "Jenis Pekerjaan",
                  hint: "Pilih Jenis Pekerjaan",
                  value: listItems[0].id,
                  items: listItems,
                  isHome: false,
                  icon: Icons.search,
                  validatorLabel: 'input data'),
              15.gH,
              CustomDropdown(
                  label: "Item Pekerjaan",
                  hint: "Pilih Jenis Pekerjaan",
                  value: listItems[0].id,
                  items: listItems,
                  isHome: false,
                  icon: Icons.search,
                  validatorLabel: 'input data'),
              15.gH,
              Text(
                'Pilih Kriteria',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: 16.0,
                runSpacing: 12.0,
                direction: Axis.horizontal,
                children: listopsi
                    .map((item) => IntrinsicWidth(
                          child: CustomRadioButton(
                            value: item,
                            groupValue: selectedValue,
                            text: item,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                          ),
                        ))
                    .toList(),
              ),
              15.gH,
              Text(
                'Pilih Penyebab',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: 16.0,
                runSpacing: 12.0,
                direction: Axis.horizontal,
                children: listopsi
                    .map((item) => IntrinsicWidth(
                          child: CustomRadioButton(
                            value: item,
                            groupValue: selectedValue,
                            text: item,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                          ),
                        ))
                    .toList(),
              ),
              15.gH,
              Container(
                height: 100,
                width: double.infinity,
                child: CustomImagePickerWithLabel(
                  label: "Foto Temuan",
                ),
              ),
              15.gH,
              CustomTextField(
                  controller: TextEditingController(),
                  label: 'Deksripsi Temuan',
                  hint: "Isi Deskripsi Temuan...")
            ],
          ),
        ),
      ),
    );
  }
}
