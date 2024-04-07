import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class ItemBottonBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 60,
      buttonBackgroundColor: Color.fromARGB(255, 3, 172, 20),
      backgroundColor: Color(0x5c000000).withOpacity(0.3),
      color: Color.fromARGB(255, 8, 73, 240),
      index: 2,
      items: [
        Icon(
          Icons.home_filled,
          color:  Color.fromRGBO(243, 244, 249, 1),
        ),
        Icon(
          Icons.people,
          color:  Color.fromRGBO(243, 244, 249, 1),
        ),
        Icon(
          Icons.menu_book,
          color:  Color.fromRGBO(243, 244, 249, 1),
        ),
        Icon(
          Icons.account_circle,
          color: Color.fromRGBO(243, 244, 249, 1),
        ),
      ],
      onTap: (index) {
        // Aquí puedes definir qué hacer cuando se selecciona cada ícono
        switch (index) {
          case 0:
            // Ir a la página de inicio
            Navigator.pushNamed(context, 'tareaCategoria');
            break;
          case 1:
            // Ir a la página de personas
            Navigator.pushNamed(context, '/');
            break;
          case 2:
            // Ir a la página de libros
            Navigator.pushNamed(context, '/detallesCategoria');
            break;
          case 3:
            // Ir a la página de perfil
            Navigator.pushNamed(context, 'Home');
            break;
          default:
            break;
        }
      },

    );
  }
}
