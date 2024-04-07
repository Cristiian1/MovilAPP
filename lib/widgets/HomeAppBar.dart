import 'package:flutter/material.dart';
import 'package:psicolbienestar/pages/AgregarCategoriaPage%20.dart';


class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Row(
        children: [
          PopupMenuButton<String>(
            icon: Icon(
              Icons.sort,
              size: 30,
              color: Color.fromARGB(255, 40, 88, 191),
            ),
            onSelected: (String value) {
              // Aquí puedes manejar las acciones según la opción seleccionada
              switch (value) {
                case '/detallesCategoria':
                  Navigator.pushNamed(context, value); // Navegar a la página de categoría
                  break;
                case 'login':
                  Navigator.pushNamed(context, value); // Navegar a la página de login
                  break;
                case 'agregarCategoria':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AgregarCategoriaPage()), // Navegar a la página de agregar nueva categoría
                  );
                  break;
                default:
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: '/detallesCategoria',
                child: Text(
                  'Categoría',
                  style: TextStyle(
                    color: Color.fromARGB(255, 10, 38, 246),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'login',
                child: Text(
                  'Login',
                  style: TextStyle(
                     color: Color.fromARGB(255, 10, 38, 246),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'agregarCategoria',
                child: Text(
                  'Agregar Nueva Categoría',
                  style: TextStyle(
                    color: Color.fromARGB(255, 10, 38, 246),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "PsicolBienestar",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xff475269),
              ),
            ),
          ),
          Spacer(),
          Icon(
            Icons.notifications,
            size: 30,
            color: Color(0xff475269),
          ),
        ],
      ),
    );
  }
}
