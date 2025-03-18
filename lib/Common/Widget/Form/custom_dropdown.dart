import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:hk_shield/App/data/models/dropdown_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
class CustomDropdown extends StatelessWidget {
  final String? label;
  final String hint;
  final dynamic value;
  final List<DropdownItem> items;
  final String validatorLabel;
  final Function? onChanged;
  const CustomDropdown({super.key, this.label, required this.hint, this.value, required this.items, required this.validatorLabel, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? '',
          style: const TextStyle(
            fontSize:12,
            fontWeight: FontWeight.w600
          ),
        ),
        DropdownButtonFormField2<String>(
            isExpanded: true,
            decoration: InputDecoration(
              prefixIcon: Container(
                width: 65,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xffECF0F4),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), bottomLeft: Radius.circular(40))
                ),
                child:
                Padding(
                    padding: EdgeInsets.only(left: 25, right: 20),
                    child:
                    Icon(BootstrapIcons.building)
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              border:OutlineInputBorder(
                borderRadius:BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Colors.black12
                )
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black12
                  ),
                  borderRadius: BorderRadius.circular(50)
              ),
            ),
            hint: Text(hint),
            items: items.map((item) => DropdownMenuItem<String>(
                value: item.id.toString(),
                child: Text(
                  item.label,
                  style: const TextStyle(
                    fontSize:14
                  ),
                )
            )).toList(),
          validator: (value) {
            if (value == null) {
              return validatorLabel;
            }
            return null;
          },
          onChanged: (value) {
            if (onChanged != null) {
              onChanged!(value);
            }
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 20),
          ),
          value: value.toString(),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 30,
              color: Colors.black,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
            isOverButton: true,
          ),
        )
      ],
    );
  }
}
