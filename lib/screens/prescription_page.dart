import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_project/utile/upload_prescription.dart';
import 'package:interactive_project/utile/login_botton.dart';
import 'package:interactive_project/utile/prescription_textfield.dart';

class PrescriptionFormPage extends StatefulWidget {
  const PrescriptionFormPage({Key? key}) : super(key: key);

  @override
  _PrescriptionFormPageState createState() => _PrescriptionFormPageState();
}

class _PrescriptionFormPageState extends State<PrescriptionFormPage> {
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم الإرسال بنجاح')),
      );

      // تفريغ الحقول بعد الإرسال
      setState(() {
        // يتم استدعاء reset() لإعادة تعيين النموذج
        _formKey.currentState!.reset();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset('lib/images/banner-bg-02.png'),
                  const SizedBox(height: 30),
                  UploadPrescription(
                    labelText: 'حمل الوصفة هنا',
                    showStar: true,
                    onImageSelected: (image) {
                      setState(() {});
                    },
                    validator: (image) {
                      if (image == null) {
                        return 'يرجى تحميل صورة';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'الشركة المصنعة',
                                    style: GoogleFonts.cairo(
                                      textStyle: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 16),
                                    ),
                                  ),
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
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2.0,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: 'الشركة الاصلية',
                                  child: Text('الشركة الاصلية',
                                      textAlign: TextAlign.right),
                                ),
                                DropdownMenuItem(
                                  value: 'الشركة البديلة',
                                  child: Text('الشركة البديلة',
                                      textAlign: TextAlign.right),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {});
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'يرجى اختيار الشركة المصنعة';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: PrescriptionTextfield(
                          labelText: 'اسم الدواء',
                          showStar: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يرجى إدخال اسم الدواء';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: PrescriptionTextfield(
                          labelText: 'العمر',
                          showStar: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يرجى إدخال العمر';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'الجنس',
                                    style: GoogleFonts.cairo(
                                      textStyle: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 16),
                                    ),
                                  ),
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
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2.0,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: 'ذكر',
                                  child:
                                      Text('ذكر', textAlign: TextAlign.right),
                                ),
                                DropdownMenuItem(
                                  value: 'أنثى',
                                  child:
                                      Text('أنثى', textAlign: TextAlign.right),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {});
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'يرجى اختيار الجنس';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'شهر/سنة',
                              style: GoogleFonts.cairo(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 16),
                              ),
                            ),
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
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'سنة',
                            child: Text('سنة', textAlign: TextAlign.right),
                          ),
                          DropdownMenuItem(
                            value: 'شهر',
                            child: Text('شهر', textAlign: TextAlign.right),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {});
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى اختيار شهر/سنة';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const PrescriptionTextfield(labelText: 'هل لديك امراض مزمنة'),
                  const SizedBox(height: 15),
                  const PrescriptionTextfield(labelText: 'مدة الاصابة'),
                  const SizedBox(height: 15),
                  const PrescriptionTextfield(labelText: 'هل لديك اعراض معينة'),
                  const SizedBox(height: 15),
                  const PrescriptionTextfield(
                      labelText: 'هل لديك حساسية لاحد مركبات الادوية'),
                  const SizedBox(height: 15),
                  const PrescriptionTextfield(
                      labelText: 'هل تتناول اي ادوية اخرى'),
                  const SizedBox(height: 15),
                  const PrescriptionTextfield(
                      labelText: 'وزن المريض(خاصة في حالات الاطفال)'),
                  const SizedBox(height: 15),
                  const SizedBox(height: 20),
                  Center(
                    child: MyLoginBotton(
                      onTap: _submitForm,
                      bottonName: 'ارسال',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
