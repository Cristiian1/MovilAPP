class Tarea {
  final int idTarea;
  final String nombre;
  final String descripcion;
  final String pregunta1;
  final String pregunta2;
  final int categoriaIdCategoria; // El ID de la categoría asociada a la tarea
  final String? respuesta1; // Cambia a String nullable
  final String? respuesta2; // Cambia a String nullable

  Tarea({
    required this.idTarea,
    required this.nombre,
    required this.descripcion,
    required this.pregunta1,
    required this.pregunta2,
    required this.categoriaIdCategoria,
    this.respuesta1, // Cambia a String nullable
    this.respuesta2, // Cambia a String nullable
  });

  factory Tarea.fromJson(Map<String, dynamic> json) {
    return Tarea(
      idTarea: json['id_tarea'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      pregunta1: json['pregunta1'],
      pregunta2: json['pregunta2'],
      categoriaIdCategoria: json['categoria_id_categoria'],
      respuesta1: json['respuesta1'], // Mantén como nullable
      respuesta2: json['respuesta2'], // Mantén como nullable
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id_tarea": idTarea,
      "nombre": nombre,
      "descripcion": descripcion,
      "pregunta1": pregunta1,
      "pregunta2": pregunta2,
      "categoria_id_categoria": categoriaIdCategoria,
      "respuesta1": respuesta1,
      "respuesta2": respuesta2,
    };
  }
}
