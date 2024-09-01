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
    Key? key,
    required this.labelText,
    this.showStar = false,
    required this.onImageSelected,
    this.validator,
  }) : super(key: key);

  @override
  _UploadPrescriptionState createState() => _UploadPrescriptionState();
}

class _UploadPrescriptionState extends State<UploadPrescription> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  List<bool> _checkboxValues =
      List.generate(9, (index) => false); // حالة صناديق الاختيار

  final List<String> _medicineNames = [
    'الدواء الأول',
    'الدواء الثاني',
    'الدواء الثالث',
    'الدواء الرابع',
    'الدواء الخامس',
    'الدواء السادس',
    'الدواء السابع',
    'الدواء الثامن',
    'جميع الأدوية'
  ];

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
                  if (pickedFile != null) {
                    setState(() {
                      _image = File(pickedFile.path);
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
                  if (pickedFile != null) {
                    setState(() {
                      _image = File(pickedFile.path);
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
      widget.onImageSelected(null);
      _checkboxValues = List.generate(
          9, (index) => false); // إعادة تعيين حالة صناديق الاختيار
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.labelText,
                style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                ),
              ),
              if (widget.showStar)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
            ],
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
        const SizedBox(height: 16),
        if (_image != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(_medicineNames.length, (index) {
                return CheckboxListTile(
                  title:
                      Text(_medicineNames[index], style: GoogleFonts.cairo()),
                  value: _checkboxValues[index],
                  onChanged: (bool? value) {
                    setState(() {
                      _checkboxValues[index] = value!;
                    });
                  },
                );
              }),
              if (widget.validator != null && widget.validator!(_image) != null)
                Text(
                  widget.validator!(_image) ?? '',
                  style: const TextStyle(color: Colors.red),
                ),
            ],
          ),
      ],
    );
  }
}
