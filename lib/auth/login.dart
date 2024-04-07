import 'package:flutter/material.dart';
import 'package:psicolbienestar/models/login.dart';
import 'package:psicolbienestar/pages/HomePage.dart';
import 'package:psicolbienestar/services/loginService.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    try {
      Usuario usuario = await ApiService.login(
        _usernameController.text.trim(),
        _passwordController.text.trim(),
      );

      // Navega a HomePageCategoria después del inicio de sesión exitoso
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePageCategoria()),
      );

      print('Inicio de sesión exitoso: ${usuario.nombre}');
    } catch (e) {
      print('Error al iniciar sesión: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(context),
    );
  }

  Widget cuerpo(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
            Color.fromARGB(248, 235, 236, 236),
              Color.fromARGB(199, 4, 120, 222),
            ], begin: Alignment.topCenter),
          ),
        ),
        Container(
          color: Color.fromARGB(255, 188, 187, 187).withOpacity(0.5),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                logo(),
                SizedBox(height: 20),
                nombre(),
                SizedBox(height: 20),
                campoUsuario(),
                SizedBox(height: 10),
                campoPassword(),
                SizedBox(height: 20),
                botonEntrar(context),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton.icon(
                      onPressed: () {
                        // Acción al presionar el botón de registro con Facebook
                      },
                      icon: Icon(
                        Icons.facebook,
                        size: 50,
                        color: Colors.blue,
                      ),
                      label: Text(""),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Acción al presionar el botón de registro con Google
                      },
                      icon: Icon(
                        Icons.g_mobiledata,
                        size: 50,
                        color: Colors.red,
                      ),
                      label: Text(""),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

 Widget logo() {
  return Container(
    width: 200,
    height: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(60),
      image: DecorationImage(
        image: AssetImage('images/logofinal.png'),
        fit: BoxFit.cover,
      ),
    ),
  );
}


  Widget nombre() {
    return Text("Iniciar sesión ",
        style: TextStyle(
            color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold));
  }

Widget campoUsuario() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    alignment: Alignment.center,
    child: Container(
      width: 300,
      child: TextField(
        controller: _usernameController,
        decoration: InputDecoration(
          labelText: 'Username',
          icon: Icon(Icons.person), // Cambié iconColor a icon
        ),
      ),
    ),
  );
}


 Widget campoPassword() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    alignment: Alignment.center,
    child: Container(
      width: 300,
      child: TextField(
        controller: _passwordController,
        decoration: InputDecoration(
          labelText: 'Password',
          icon: Icon(Icons.lock), // Cambiado iconColor a icon y agregado un ícono de candado
        ),
        obscureText: true, // Para ocultar el texto de la contraseña
      ),
    ),
  );
}

Widget botonEntrar(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    child: ElevatedButton(
      onPressed: () {
        _login(context); // Llamar a la función _login con el contexto actual
      },
      child: Text('Login'),
    ),
  );
}


}