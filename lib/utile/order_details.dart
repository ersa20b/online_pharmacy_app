import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Table(
                // border: TableBorder.all(color: Colors.grey), // إضافة حدود للجدول
                columnWidths: const {
                  0: FlexColumnWidth(2), // ضبط عرض العمود الأول
                  1: FlexColumnWidth(3), // ضبط عرض العمود الثاني
                },
                children: [
                  _buildTableRow('النوع', 'صيدلية'),
                  _buildTableRow('الاسم', 'صيدلية النوفليين المركزية'),
                  _buildTableRow('الوصف', 'جميع الادوية متوفرة'),
                  _buildTableRow('السعر الكلي', '88'),
                  _buildTableRow(
                    'رقم الهاتف',
                    '0927797287',
                  ),
                  _buildTableRow(
                      'خدمة التوصيل',
                      Text(
                        'متوفر',
                        style: TextStyle(color: Colors.grey.shade700),
                      )),
                  _buildTableRow(
                      'الموقع',
                      Text(
                        'عرض الموقع',
                        style: GoogleFonts.cairo(
                            color: Theme.of(context).primaryColor),
                      )),
                ],
              ),
            ],
          ),
        ));
  }

  TableRow _buildTableRow(String title, dynamic content) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,
              style: GoogleFonts.cairo(
                fontSize: 14,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: content is Widget
              ? content
              : Text(
                  content.toString(),
                  style: GoogleFonts.cairo(
                      fontSize: 14, color: Colors.grey.shade700),
                ),
        ),
      ],
    );
  }
}
