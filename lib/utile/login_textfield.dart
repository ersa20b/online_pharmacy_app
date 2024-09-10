import 'package:flutter/material.dart';

class Mytextfeild extends StatelessWidget {
  final String textHint;
  final bool obscureText;
  final String lable;
  final TextEditingController? controller; // أضفنا المتحكم للنص
  final String? errorText; // أضفنا رسالة الخطأ

  const Mytextfeild({
    super.key,
    required this.textHint,
    required this.obscureText,
    required this.lable,
    this.controller, // المتحكم اختياري
    this.errorText, // رسالة الخطأ اختيارية
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            lable,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller, // ربط الحقل بالمتحكم
            obscureText: obscureText,
            textAlign: TextAlign.end,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: textHint,
              hintStyle: TextStyle(
                color: Colors.grey.shade500,
              ),
              errorText: errorText, // عرض رسالة الخطأ إذا كانت موجودة
            ),
          ),
        ],
      ),
    );
  }
}
