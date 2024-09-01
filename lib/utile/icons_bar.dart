import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconsBar extends StatelessWidget {
  final String imageDirectory;
  final String imagetext;
  const IconsBar({super.key,required this.imageDirectory,required this.imagetext});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.all(15),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade100),
        child: Image.asset(
          imageDirectory,
          height: 30,
          width: 30,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Text(
       imagetext,
        style: GoogleFonts.cairo(
            textStyle: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold)),
      )
    ]);
  }
}
