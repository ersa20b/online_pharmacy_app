import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_project/utile/login_botton.dart';
import 'package:interactive_project/utile/login_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // المتغيرات لحفظ البيانات المدخلة
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // متغيرات لإظهار رسائل الخطأ
  String? emailError;
  String? passwordError;

  // دالة تسجيل الدخول والتحقق من البريد وكلمة المرور
  void signUserIn(BuildContext context) {
    setState(() {
      // إعادة تعيين رسائل الخطأ إلى null
      emailError = null;
      passwordError = null;

      // الحصول على القيم المدخلة
      String email = emailController.text;
      String password = passwordController.text;

      // التحقق من صحة البريد الإلكتروني وكلمة المرور
      if (email != "rahmoshimoshi@gmail.com") {
        emailError = 'البريد الإلكتروني غير صحيح';
      }
      if (password != "123456789") {
        passwordError = 'كلمة المرور غير صحيحة';
      }

      // إذا كانت المدخلات صحيحة، الانتقال إلى الصفحة التالية
      if (emailError == null && passwordError == null) {
        emailController.clear();
        passwordController.clear();
        Navigator.pushNamed(context, '/main');
      }
    });
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
              const SizedBox(height: 50),
              Center(
                child: Text(
                  'تسجيل الدخول',
                  style: GoogleFonts.cairo(
                    textStyle:
                        TextStyle(fontSize: 28, color: Colors.grey.shade600),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              // حقل البريد الإلكتروني مع عرض رسالة الخطأ إن وجدت
              Mytextfeild(
                textHint: 'email@example.com',
                obscureText: false,
                lable: 'البريد الالكتروني',
                controller: emailController,
                errorText: emailError,
              ),
              const SizedBox(height: 25),
              // حقل كلمة المرور مع عرض رسالة الخطأ إن وجدت
              Mytextfeild(
                textHint: '********',
                obscureText: true,
                lable: 'كلمة المرور',
                controller: passwordController,
                errorText: passwordError,
              ),
              const SizedBox(height: 70),
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
        ),
      ),
    );
  }
}
