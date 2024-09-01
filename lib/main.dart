import 'package:flutter/material.dart';
import 'package:interactive_project/screens/home_page.dart';
import 'package:interactive_project/screens/login_page.dart';
import 'package:interactive_project/screens/notifications_page.dart';
import 'package:interactive_project/screens/onbording_page.dart';
import 'package:interactive_project/screens/prescription_page.dart';
import 'package:interactive_project/screens/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff75B239),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnbordingPage(),
        '/login': (context) => const LoginPage(),
        '/main': (context) => const HomePage(),
        '/prescription': (context) => const PrescriptionFormPage(),
        '/notifications': (context) => const NotificationsPage(),
        '/signup': (context) => const SignupPage(),
      },
    );
  }
}
