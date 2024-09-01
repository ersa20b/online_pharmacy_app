import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Lottie.asset(
              'lib/animations/Animation - 1723514259541.json',
            )),
            Text(
              ' كل الادوية متوفرة مع شبكة واسعة من الصيدليات التي يتم عرضها حسب الاقرب لك',
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
