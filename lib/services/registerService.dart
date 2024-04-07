import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:psicolbienestar/services/api.dart';

class ApiService {
  static Future<void> registrar(String nombre, String apellido, String correo, String password) async {
    http.Response? response; // Inicializa la variable como nula
    try {
      response = await http.post(
        Uri.parse('$apiUrl/API_Usuario/usuario/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'username': nombre,
          'apellido': apellido,
          'email': correo,
          'password': password,
          'is_active': true,
        }),
      );

if (response.statusCode >= 200 && response.statusCode < 300) {
      print('Registro exitoso');
      } else {
        throw Exception('Failed to register');
      }
    } catch (e) {
      print('Error de red: $e');
      // Ahora puedes acceder a la variable `response` dentro del bloque `try-catch`
      if (response != null) {
        print('Cuerpo de la respuesta: ${response.body}');
      }
      throw Exception('Error de red: $e');
    }
  }
}
