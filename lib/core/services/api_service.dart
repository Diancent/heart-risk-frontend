import 'dart:convert';
import 'package:http/http.dart' as http;

class HeartRiskService {
  static const String _baseUrl = 'http://127.0.0.1:8000';

  // POST запит для надсилання даних на сервер
  Future<Map<String, dynamic>> sendHeartRiskData(
      Map<String, dynamic> inputData) async {
    final url = Uri.parse('$_baseUrl/api/heart-risk/predict');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(inputData),
      );

      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to load prediction: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error sending data: $e');
    }
  }
}
