import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:psicolbienestar/models/login.dart';
import 'package:psicolbienestar/services/api.dart';

class ApiService {
  // final String baseUrl = 'http://192.168.137.77:8000/API_Usuario';

  static Future<Usuario> login(String username, String password) async {
    final response = await http.post(
      // Uri.parse('http://127.0.0.1:8000/API_Usuario/login'),
      Uri.parse('$apiUrl/API_Usuario/login'),
      body: {'username': username, 'password': password},
    );

    if (response.statusCode  >= 200 && response.statusCode < 300) {
      Map<String, dynamic> data = json.decode(response.body);
      return Usuario.fromJson(data);
    } else {
      throw Exception('Failed to login');
    }
  }
}