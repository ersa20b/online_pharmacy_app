import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'هنا ستصل جميع الاشعارات للمستخدم ',
          style: GoogleFonts.cairo(textStyle: const TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
