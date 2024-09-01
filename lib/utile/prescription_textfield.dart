import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrescriptionTextfield extends StatelessWidget {
  final String? labelText; // تغيير نوع labelText ليكون String؟
  final bool showStar; // خاصية لتحديد ما إذا كانت النجمة ستعرض أم لا
  final String? Function(String?)? validator; // تابع للتحقق من صحة الإدخال
  final void Function(String?)? onChanged; // تابع للتعامل مع تغييرات الإدخال

  const PrescriptionTextfield({
    super.key,
    this.labelText,
    this.showStar = false,
    this.validator, // تعيين الخاصية validator
    this.onChanged, // تعيين الخاصية onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null &&
            showStar) // عرض التسمية فقط إذا لم تكن null و showStar true
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: labelText,
                  style: GoogleFonts.cairo(
                    textStyle:
                        TextStyle(color: Colors.grey.shade600, fontSize: 16),
                  ),
                ),
                const TextSpan(
                  text: ' *',
                  style: TextStyle(
                    color: Colors.red, // لون النجمة الحمراء
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          // الحقول التي لا يوجد بها نجمة 
        if (labelText != null &&
            !showStar) // عرض التسمية فقط إذا لم تكن null و showStar false
          Text(
            labelText!,
            style: GoogleFonts.cairo(
              textStyle: TextStyle(color: Colors.grey.shade600, fontSize: 16),
            ),
          ),
          // كود الحقل 
        const SizedBox(height: 8), // المسافة بين التسمية والحقل
        TextFormField(
          textAlign: TextAlign.right, // محاذاة النص إلى اليمين
          textDirection: TextDirection.rtl, // تحديد اتجاه النص لليمين
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.0,
              ),
            ),
            // كود الفوكس للحقول 
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2.0,
              ),
            ),
            /*border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),*/
            labelText: null, // إزالة التسمية الافتراضية
          ),
          validator: validator, // استخدام validator هنا
          onChanged: onChanged, // استخدام onChanged هنا
        ),
      ],
    );
  }
}
