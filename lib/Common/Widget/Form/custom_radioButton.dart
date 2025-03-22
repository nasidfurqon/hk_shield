import 'package:flutter/material.dart';
import 'package:hk_shield/Common/Extensions/gaps_extension.dart';

class CustomRadioButton extends StatelessWidget {
  final String value;
  final String? groupValue;
  final String text;
  final Function(String) onChanged;

  const CustomRadioButton({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return Column(
      children: [
        InkWell(
          onTap: () => onChanged(value),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                // Custom radio circle
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected ? Color(0xff224596) :Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? Center(
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(0xff224596),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                      : null,
                ),

                const SizedBox(width: 12),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
