import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path/path.dart' as path;
import 'package:psicolbienestar/models/categoria.dart';

class CategoriaService with ChangeNotifier {
  
  final String baseUrl =  'http://192.168.2.5:8000/API/Categoria/';

  List<Categoria> _categorias = []; // Lista de categorías

  List<Categoria> get categorias => _categorias; // Getter para obtener la lista de categorías

  set categorias(List<Categoria> value) {
    _categorias = value; // Setter para actualizar la lista de categorías
    notifyListeners(); // Notifica a los escuchadores del cambio
  }

  Future<List<Categoria>> getCategorias() async {
    print('URL de la API: $baseUrl');
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print(data);
      return data.map((json) => Categoria.fromJson(json)).toList();
    } else {
      print('Error al obtener las categorías: ${response.statusCode}');
      print('Mensaje de error: ${response.body}');
      throw Exception('Error al obtener las categorías');
    }
  }

  Future<void> agregarCategoria(Categoria categoria, File? imgFile) async {
    try {
      if (imgFile != null) {
        final bytes = await imgFile.readAsBytes();
        final imageMultipart = http.MultipartFile.fromBytes(
          'imagen',
          bytes,
          filename: path.basename(imgFile.path),
        );
        final request = http.MultipartRequest('POST', Uri.parse(baseUrl));
        request.fields['nombre'] = categoria.nombre;
        request.fields['descripcion'] = categoria.descripcion;
        request.files.add(imageMultipart);
        final streamedResponse = await request.send();
        if (streamedResponse.statusCode == 201) {
          notifyListeners();
        } else {
          throw Exception(
              'Error al agregar la categoría: ${streamedResponse.reasonPhrase}');
        }
      } else {
        final response = await http.post(
          Uri.parse(baseUrl),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(categoria.toJson()),
        );
        if (response.statusCode == 201) {
          notifyListeners();
        } else {
          throw Exception('Error al agregar la categoría: ${response.reasonPhrase}');
        }
      }
    } catch (e) {
      throw Exception('Error al agregar la categoría: $e');
    }
  }

  Future<void> actualizarCategoria(Categoria categoria, File imagenFile) async {
    try {
      final url = Uri.parse('$baseUrl${categoria.idCategoria}/');
      
      var request = http.MultipartRequest('PUT', url);
      request.headers['Content-Type'] = 'multipart/form-data';
      request.fields['nombre'] = categoria.nombre;
      request.fields['descripcion'] = categoria.descripcion;
      
      var fileStream = http.ByteStream(imagenFile.openRead());
      var length = await imagenFile.length();

      var multipartFile = http.MultipartFile(
        'imagen',
        fileStream,
        length,
        filename: 'imagen.jpg',
      );

      request.files.add(multipartFile);

      var response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        notifyListeners();
      } else {
        throw Exception('Error al actualizar la categoría: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error al actualizar la categoría: $e');
    }
  }

  Future<void> eliminarCategoria(int idCategoria) async {
    final url = '$baseUrl$idCategoria/';
    try {
      final response = await http.delete(Uri.parse(url));
      if (response.statusCode == 204) {
        notifyListeners();
      } else {
        throw Exception('Error al eliminar la categoría en la API');
      }
    } catch (e) {
      throw Exception('Error al eliminar la categoría: $e');
    }
  }

  Future<void> editarCategoria(int idCategoria, String nombre, String descripcion, File imagenFile) async {
    final url = Uri.parse('$baseUrl$idCategoria/');
    var formData = FormData.fromMap({
      'nombre': nombre,
      'descripcion': descripcion,
      'imagen': await MultipartFile.fromFile(imagenFile.path, filename: 'imagen.jpg'),
    });
    try {
      final response = await http.put(
        url,
        body: formData,
        headers: {
          HttpHeaders.contentTypeHeader: 'multipart/form-data',
        },
      );
      if (response.statusCode == 200) {
        notifyListeners();
      } else {
        print('Error al editar la categoría: ${response.statusCode}');
        print('Mensaje de error: ${response.body}');
        throw Exception('Error al editar la categoría: ${response.statusCode}');
      }
    } catch (e) {
      print('Excepción al editar la categoría: $e');
      throw Exception('Excepción al editar la categoría: $e');
    }
  }
}
