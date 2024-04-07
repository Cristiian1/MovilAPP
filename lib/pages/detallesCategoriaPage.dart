import 'package:flutter/material.dart';
import 'package:psicolbienestar/models/categoria.dart';
import 'package:psicolbienestar/pages/TareaCategoriaPage.dart';
import 'package:psicolbienestar/pages/HomePage.dart'; // Importa la página de inicio

class DetallesCategoriaPage extends StatelessWidget {
  final Categoria categoria;

  DetallesCategoriaPage({Key? key, required this.categoria}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoria.nombre),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: Text(
                categoria.nombre,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(6, 64, 241, 0.882),
                ),
              ),
            ),
            SizedBox(height: 10),
            Image.network(
              categoria.imagen,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                categoria.descripcion,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Mostrar las tarjetas de las tareas
            _buildTaskCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard(BuildContext context) {
    List<Map<String, String>> tareas = [
      {"titulo": "Aprender a amarte", "descripcion": "Y si te queda gustando", "page": "TareaCategoria"}, // Página de TareaCategoriaPage
      {"titulo": "Contactar a un profesional", "descripcion": "Permitete iniciar tu proceso psicológico con nosotros", "page": "HomePageCategoria"}, // Página de HomePageCategoria
      {"titulo": "Nuevo Aprendizaje", "descripcion": "Disfruta de los recursos educativos que tenemos para TI", "page": "HomePageCategoria"}, // Página de HomePageCategoria
    ];

    return Column(
      children: tareas.map((tarea) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(maxWidth: 300),
            child: Card(
              elevation: 3,
              child: InkWell(
                onTap: () {
                  // Navegar a la página correspondiente
                  if (tarea['page'] == 'TareaCategoria') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TareaCategoriaPage(idTarea: 1),
                      ),
                    );
                  } else if (tarea['page'] == 'HomePageCategoria') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                         builder: (context) => HomePageCategoria(scrollToProfessionals: true),
                      ),
                    );
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        tarea["titulo"]!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 238, 65, 12),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        tarea["descripcion"]!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Navegar a la página correspondiente cuando se presiona el botón
                          if (tarea['page'] == 'TareaCategoria') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TareaCategoriaPage(idTarea: 1),
                              ),
                            );
                          } else if (tarea['page'] == 'HomePageCategoria') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                 builder: (context) => HomePageCategoria(scrollToRecursos: true),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: Text(
                          'Ingresar',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 240, 241, 244),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
