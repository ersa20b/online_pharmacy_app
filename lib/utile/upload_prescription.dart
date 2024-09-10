import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadPrescription extends StatefulWidget {
  final String labelText;
  final bool showStar;
  final void Function(File?) onImageSelected;
  final String? Function(File?)? validator;

  const UploadPrescription({
    super.key,
    required this.labelText,
    this.showStar = false,
    required this.onImageSelected,
    this.validator,
  });

  @override
  UploadPrescriptionState createState() => UploadPrescriptionState();
}

class UploadPrescriptionState extends State<UploadPrescription> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool _showCheckboxes = false;
  // قائمة لتخزين حالة كل صندوق اختيار
  List<bool> _checkboxValues = List.generate(8, (index) => false);

  // دالة لإعادة تعيين الصورة
  void resetImage() {
    setState(() {
      _image = null;
      _showCheckboxes = false;
      _checkboxValues =
          List.generate(8, (index) => false); // إعادة تعيين حالة الصناديق
    });
  }

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('التقاط صورة'),
                onTap: () async {
                  Navigator.of(context).pop();
                  final pickedFile =
                      await _picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null && pickedFile.path.isNotEmpty) {
                    setState(() {
                      _image = File(pickedFile.path);
                      _showCheckboxes = true; // عرض صناديق الاختيار
                      widget.onImageSelected(_image);
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('اختيار من الاستوديو'),
                onTap: () async {
                  Navigator.of(context).pop();
                  final pickedFile =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null && pickedFile.path.isNotEmpty) {
                    setState(() {
                      _image = File(pickedFile.path);
                      _showCheckboxes = true; // عرض صناديق الاختيار
                      widget.onImageSelected(_image);
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _removeImage() {
    setState(() {
      _image = null;
      _showCheckboxes = false; // إخفاء صناديق الاختيار
      _checkboxValues =
          List.generate(8, (index) => false); // إعادة تعيين حالة الصناديق
      widget.onImageSelected(null);
    });
  }

  void _onCheckboxChanged(int index, bool? value) {
    setState(() {
      _checkboxValues[index] = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: GoogleFonts.cairo(
            textStyle: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 8),
        _image == null
            ? GestureDetector(
                onTap: _pickImage,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 1.0,
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.upload_file, color: Colors.grey),
                      SizedBox(width: 10),
                      Text(
                        'لم يتم اختيار صورة',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              )
            : Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 1.0,
                      ),
                    ),
                    child: Image.file(
                      _image!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _removeImage,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        if (_showCheckboxes) ...[
          const SizedBox(height: 15),
          ...List.generate(8, (index) {
            return CheckboxListTile(
              title: Text('الدواء ${index + 1}'),
              value: _checkboxValues[index],
              onChanged: (value) => _onCheckboxChanged(index, value),
            );
          }),
        ],
      ],
    );
  }
}
