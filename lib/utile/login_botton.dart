import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyLoginBotton extends StatelessWidget {
  final Function()? onTap;
  final String bottonName;

  const MyLoginBotton(
      {super.key, required this.onTap, required this.bottonName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 2),

        color: Theme.of(context).primaryColor,
       

        child: Center(
          child: Text(bottonName,
              style: GoogleFonts.cairo(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              )),
        ),
      ),
    );
  }
}
