import 'dart:io';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:hk_shield/Common/Extensions/gaps_extension.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePickerWithLabel extends StatefulWidget {
  final String label;
  final Function(File?)? onImagePicked;

  const CustomImagePickerWithLabel({
    super.key,
    required this.label,
    this.onImagePicked,
  });

  @override
  State<CustomImagePickerWithLabel> createState() =>
      _CustomImagePickerWithLabelState();
}

class _CustomImagePickerWithLabelState
    extends State<CustomImagePickerWithLabel> {
  File? _selectedImage;
  String? _fileName;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final File file = File(image.path);

      setState(() {
        _selectedImage = file;
        _fileName = image.name;
      });

      widget.onImagePicked?.call(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        4.gH,
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(BootstrapIcons.upload, color: Colors.grey, size: 40,),
                8.gW,
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        _fileName ?? 'JPG or PNG,\n Ukuran File tidak boleh lebih dari 5MB',
                        style: TextStyle(
                          fontSize: 14,
                          color: _fileName != null ? Colors.black : Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_selectedImage != null) ...[
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              _selectedImage!,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ],
    );
  }
}
