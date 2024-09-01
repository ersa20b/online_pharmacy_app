// lib/api_service.dart
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);//constructor

  Future<void> login(String email, String password) async { 
    final response = await http.post(
      Uri.parse('$baseUrl/login'), // استبدل بـ URL الخاص بالـ Backend
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', response.body); // استبدل بـ التوكن الفعلي إذا كان موجوداً
    } else {
      throw Exception('فشل تسجيل الدخول');
    }
  }
}
