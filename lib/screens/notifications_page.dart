import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_fonts/google_fonts.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Card(
              //color: Theme.of(context).primaryColor,
              child: ListTile(
                leading: const Icon(
                  Icons.notifications_active,
                ),
                title: Text(
                  'صيدلية النوفليين المركزية',
                  style:
                      GoogleFonts.cairo(color: Theme.of(context).primaryColor),
                ),
                subtitle: Text(
                  'عميلنا العزيز,دواءك متوفر داخل الصيدلية',
                  style: GoogleFonts.cairo(color: Colors.black),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/orderdetails');
                  },
                  icon: const Icon(Icons.remove_red_eye),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
