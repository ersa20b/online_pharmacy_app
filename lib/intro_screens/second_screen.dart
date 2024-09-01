import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'lib/animations/Animation - 1723511774597.json',
            ),
            Text(
              ' استفد من خدماتنا على مدار الساعة وطوال الاسبوع لتلبية احتياجاتك بكل سهولة وسرعة',
              style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                      fontSize: 20, color: Theme.of(context).primaryColor)),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
