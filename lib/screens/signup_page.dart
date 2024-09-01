import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_project/utile/login_botton.dart';
import 'package:interactive_project/utile/login_textfield.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});
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
                'التسجيل',
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
              textHint: 'ادخل الاسم هنا',
              obscureText: false,
              lable: 'الاسم',
            ),
            const SizedBox(
              height: 25,
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
              textHint: '09x-xxxxxxx',
              obscureText: false,
              lable: 'رقم الهاتف',
            ),
            const SizedBox(
              height: 25,
            ),
            const Mytextfeild(
              textHint: 'ادخل مدينة',
              obscureText: false,
              lable: 'المدينة ',
            ),
            const SizedBox(
              height: 25,
            ),
            const Mytextfeild(
              textHint: '**********',
              obscureText: true,
              lable: 'كلمة المرور',
            ),
            const SizedBox(
              height: 25,
            ),
            const Mytextfeild(
              textHint: '**********',
              obscureText: true,
              lable: 'تأكيد كلمة المرور',
            ),
            const SizedBox(
              height: 70,
            ),
            MyLoginBotton(
              onTap: () => signUserIn(context),
              bottonName: 'التسجيل',
            ),
            const SizedBox(height: 20),
            Center(
              child: GestureDetector(
                child: Text(
                  'لديك حساب من قبل؟ تسجيل دخول',
                  style: GoogleFonts.cairo(
                    textStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      )),
    );
  }
}
