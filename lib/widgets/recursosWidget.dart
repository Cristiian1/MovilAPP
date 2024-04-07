import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RecursosWidget extends StatefulWidget {
  @override
  _RecursosWidgetState createState() => _RecursosWidgetState();
}

class _RecursosWidgetState extends State<RecursosWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: ScrollPhysics(), // Permitir deslizar horizontalmente
      child: Row(
        children: [
          for (int i = 1; i <= 3; i++) _buildRecursosCard(context, i),
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

  Widget _buildRecursosCard(BuildContext context, int index) {
    return GestureDetector(
      // onTap: () {
      //   // Navegar a la página de detalles del profesional
      //   // Navigator.pushNamed(context, "/recursosWidget");
      // },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 47, 17, 239)
                  .withOpacity(0.5), // Color verde con opacidad
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
            width: 200, // Ancho de la tarjeta
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(
                    "images/recurso$index.jpg",
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
                        "Libro $index",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 13, 31, 226),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Descripción del recurso $index",
                        style: TextStyle(
                          fontSize: 13,
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
                            'https://www.youtube.com/@psimammoliti'); // Lógica para abrir el enlace
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(
                            255, 2, 79, 245), // Color de fondo del botón
                      ),
                      child: Text(
                        "Conocer más",
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
    );
  }
}
