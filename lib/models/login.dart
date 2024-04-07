class Usuario {
  final String nombre;
  final String password;
  final String token;

  Usuario({required this.nombre, required this.password, required this.token});

factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
     nombre: json['nombre'] ?? '', // Si es null, asigna una cadena vacía
    password: json['password'] ?? '', // Si es null, asigna una cadena vacía
    token: json['token'] ?? '',
    );
  }
}
     // Si es null, asigna una cadena vacía
