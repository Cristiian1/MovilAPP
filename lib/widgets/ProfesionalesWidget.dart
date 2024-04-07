import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfesionalesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection:
          Axis.vertical, // Cambiar dirección de desplazamiento a vertical
      physics: ScrollPhysics(), // Permitir deslizar verticalmente
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Estirar las tarjetas horizontalmente
        children: [
          for (int i = 1; i <= 2; i++) // Cambiar de tres a dos columnas
            _buildColumn(context, i),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir $url';
    }
  }

  Widget _buildColumn(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int j = 1; j <= 2; j++) // Cambiar de tres a dos columnas
          _buildProfesionalCard(context, ((index - 1) * 2) + j),
      ],
    );
  }

  Widget _buildProfesionalCard(BuildContext context, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Navegar a la página de detalles del profesional
          Navigator.pushNamed(context, "/detallesProfesional");
        },
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color:
                    Colors.green.withOpacity(0.5), // Color verde con opacidad
                spreadRadius: 0.1, // Extensión de la sombra
                blurRadius: 19, // Difuminado de la sombra
                offset: Offset(0, 2), // Desplazamiento de la sombra
              ),
            ],
          ),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.all(10),
            child: SizedBox(
              height: 350, // Altura de cada tarjeta
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centrar verticalmente
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.asset(
                      "images/profesional$index.jpg",
                      height: 170,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Harol Londoño $index",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 17, 210, 52),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Descripción del Profesional $index",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        onPressed: () {
                          _launchURL(
                              'https://www.google.com/intl/es-419/gmail/about/'); // Lógica para abrir el enlace
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(
                              255, 3, 94, 50), // Color de fondo del botón
                        ),
                        child: Text(
                          "Contactar",
                          style: TextStyle(
                              color: Colors
                                  .white), // Cambiar el color del texto a blanco
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
