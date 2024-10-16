import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  final String baseUrl = "http://127.0.0.1:8000"; // Use your local IP address

  Future<Map<String, dynamic>?> registerUser(
      String name, String email, String password) async {
    final String url = "$baseUrl/register";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (error) {
      print('Registration failed: $error');
      return null;
    }
  }

  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    final String url = "$baseUrl/login";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (error) {
      print('Login failed: $error');
      return null;
    }
  }
}
