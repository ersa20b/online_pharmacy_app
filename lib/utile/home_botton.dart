import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBotton extends StatelessWidget {
  final Function()? onTap;

  const HomeBotton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Text('! حمل وصفتك الان ',
            style: GoogleFonts.cairo(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: 20,
              ),
            )),
      ),
    );
  }
}
