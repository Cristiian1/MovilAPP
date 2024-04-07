
import 'package:meta/meta.dart';
import 'dart:convert';

List<Categoria> categoriaFromJson(String str) => List<Categoria>.from(json.decode(str).map((x) => Categoria.fromJson(x)));

String categoriaToJson(List<Categoria> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categoria {
    final int idCategoria;
    final String nombre;
    final String descripcion;
    final String imagen;

    Categoria({
        required this.idCategoria,
        required this.nombre,
        required this.descripcion,
        required this.imagen,
    });

    factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        idCategoria: json["id_categoria"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
    );

    Map<String, dynamic> toJson() => {
        "id_categoria": idCategoria,
        "nombre": nombre,
        "descripcion": descripcion,
        "imagen": imagen,
    };
}
