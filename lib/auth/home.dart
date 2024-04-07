import 'package:flutter/material.dart';
import 'package:psicolbienestar/auth/Registro.dart';
import 'package:psicolbienestar/auth/login.dart';
import 'package:psicolbienestar/widgets/logo_container.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
  body: Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: <Color>[
          Color.fromARGB(248, 235, 236, 236),
          Color.fromARGB(199, 4, 120, 222),
        ],
        begin: Alignment.topCenter,
      ),
    ),
    child: ListView(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 200),
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                IconContainer(
                  url: 'images/logofinal.png',
                ),
                Text(
                  'Para fortalecer tu salud mental',
                  style: TextStyle(
                    fontFamily: 'FredokaOne',
                    fontSize: 20.0, // Tamaño de letra ajustado para móvil
                    color: Color.fromARGB(248, 5, 47, 231),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.0), // Espaciado entre el texto y los botones

                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      final route = MaterialPageRoute(
                          builder: (context) => LoginScreen(key: UniqueKey()));
                      Navigator.push(context, route);
                    },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 7, 45, 235),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold, // Texto en negrita
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0), // Espaciado entre los botones

                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      final route = MaterialPageRoute(
                          builder: (context) => RegistroScreen(key: UniqueKey()));
                      Navigator.push(context, route);
                    },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 7, 45, 235),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Regístrate',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold, // Texto en negrita
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    ),
  ),
),
    );
  }
}
