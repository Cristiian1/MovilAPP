import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:psicolbienestar/models/tareas.dart';

class TareaService {
  final String apiUrl = 'http://192.168.20.116:8000/API/Tareas';
  Future<Tarea> getTarea(int idTarea) async {
  try {
    final response = await http.get(Uri.parse('$apiUrl/$idTarea/'));
    print('Estado de la respuesta de la API: ${response.statusCode}');
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      print('Datos de la tarea obtenidos de la API: $data');
      Tarea tarea = Tarea.fromJson(data);
      return tarea;
    } else {
      print('Error al cargar la tarea: ${response.statusCode}');
      throw Exception('Error al cargar la tarea: ${response.statusCode}');
    }
  } catch (e) {
    print('Error al cargar la tarea: $e');
    throw Exception('Error al cargar la tarea: $e');
  }
}



  Future<void> enviarRespuestas(int idTarea, String respuesta1, String respuesta2) async {
    try {
      final response = await http.patch(
        Uri.parse('$apiUrl/$idTarea/'),
        body: json.encode({
          'respuesta1': respuesta1,
          'respuesta2': respuesta2,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        print('Respuestas enviadas correctamente');
      } else {
        print('Error al enviar las respuestas: ${response.statusCode}');
        throw Exception('Error al enviar las respuestas: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al enviar las respuestas: $e');
      throw Exception('Error al enviar las respuestas: $e');
    }
  }
}
