import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ApiService {
  final String baseUrl = 'https://backend-url/api';

  Future<void> submitPrescriptionForm({
    required String age,
    required String ageType,
    required String gender,
    required String question1,
    required String question2,
    required String question3,
    required String question4,
    required String question5,
    required String question6,
    required String question7,
    required String description,
    XFile? image,
  }) async {
    final uri = Uri.parse('$baseUrl/save');

    final request = http.MultipartRequest('POST', uri);

    // إضافة الحقول
    request.fields['age'] = age;
    request.fields['age_type'] = ageType;
    request.fields['gender'] = gender;
    request.fields['question_1'] = question1;
    request.fields['question_2'] = question2;
    request.fields['question_3'] = question3;
    request.fields['question_4'] = question4;
    request.fields['question_5'] = question5;
    request.fields['question_6'] = question6;
    request.fields['question_7'] = question7;
    request.fields['description'] = description;

    // إضافة ملف الصورة
    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath('image', image.path));
    }

    {
      final response = await request.send();

      if (response.statusCode == 200) {
        print('تم الإرسال بنجاح');
      } else {
        print('فشل الإرسال: ${response.reasonPhrase}');
      }
    }
  }
}
