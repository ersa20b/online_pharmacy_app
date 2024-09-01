import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_project/utile/login_botton.dart';
import 'package:interactive_project/utile/login_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  void signUserIn(BuildContext context) {
    Navigator.pushNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                'تسجيل الدخول',
               
                style: GoogleFonts.cairo(
                  textStyle:
                      TextStyle(fontSize: 28, color: Colors.grey.shade600),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Mytextfeild(
              textHint: 'email@example.com',
              obscureText: false,
              lable: 'البريد الالكتروني',
            ),
            const SizedBox(
              height: 25,
            ),
            const Mytextfeild(
              textHint: '********',
              obscureText: true,
              lable: 'كلمة المرور',
            ),
            const SizedBox(
              height: 70,
            ),
            MyLoginBotton(
              onTap: () => signUserIn(context),
              bottonName: 'الدخول',
            ),
            const SizedBox(height: 20),
            Center(
              child: GestureDetector(
                child: Text(
                  'ليس لديك حساب من قبل ؟ حساب جديد',
                  style: GoogleFonts.cairo(
                    textStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
