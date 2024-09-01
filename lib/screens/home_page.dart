import 'package:flutter/material.dart';
import 'package:interactive_project/screens/notifications_page.dart';
import 'package:interactive_project/utile/home_botton.dart';
import 'package:interactive_project/utile/icons_bar.dart';
import 'package:interactive_project/utile/botton_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_project/screens/prescription_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavWidget(
        selectedIndex: _selectedIndex,
        onTabChange: _onItemTapped,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          // الصفحة الرئيسية
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    margin: const EdgeInsets.only(top: 50, bottom: 15),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset(
                          'lib/images/medcine.jpg',
                          width: 350,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: 350,
                          height: 200,
                          alignment: Alignment.bottomCenter,
                          decoration: const BoxDecoration(
                            color: Colors.black45,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              '  البحث عن الادوية لم يكن يوما أسهل ',
                              style: GoogleFonts.cairo(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconsBar(
                          imageDirectory:
                              'lib/images/24-hours-drugs-delivery.png',
                          imagetext: ' ! خدمات 24/7'),
                      IconsBar(
                        imageDirectory: 'lib/images/pills.png',
                        imagetext: '!خيارات متنوعة',
                      ),
                      IconsBar(
                        imageDirectory: 'lib/images/medicine.png',
                        imagetext: '!خطوات بسيطة ',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/images/certificate.png',
                        height: 190,
                        width: 190,
                      ),
                      HomeBotton(
                        onTap: () {
                          Navigator.pushNamed(context, '/prescription');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // صفحة حمل الوصفة
          const PrescriptionFormPage(),
          // صفحة الإشعارات
          const NotificationsPage(),
        ],
      ),
    );
  }
}
