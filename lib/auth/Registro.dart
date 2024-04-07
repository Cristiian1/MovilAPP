import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:psicolbienestar/auth/login.dart';
import 'package:psicolbienestar/services/registerService.dart'; // Asegúrate de importar LoginScreen

class RegistroScreen extends StatefulWidget {
  RegistroScreen({Key? key}) : super(key: key);

  @override
  _RegistroScreenState createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();

  Future<void> _registrar(BuildContext context) async {
    try {
      // Llamar al servicio de registro con los datos de los TextFields
      await ApiService.registrar(
        _nombreController.text.trim(),
        _apellidoController.text.trim(),
        _correoController.text.trim(),
        _passwordController.text.trim(),
      );

      // Mostrar diálogo de registro exitoso
      _mostrarDialogoRegistroExitoso(context);
    } on http.ClientException catch (e) {
      // Manejar errores específicos de la comunicación con el servidor
      _mostrarErrorRegistro(
          context, 'Error de comunicación con el servidor: $e');
    } catch (e) {
      // Manejar otros errores
      _mostrarErrorRegistro(context, 'Error al registrar: $e');
    }
  }

  void _mostrarDialogoRegistroExitoso(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registro exitoso'),
          content: Text(
              'Tu registro ha sido completado con éxito. Ahora puedes iniciar sesión.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navegar a la pantalla de inicio de sesión
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarErrorRegistro(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error de registro'),
          content: Text(error),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
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
            gradient: LinearGradient(
              colors: <Color>[
                Color.fromARGB(248, 235, 236, 236),
                Color.fromARGB(199, 4, 120, 222),
              ],
              begin: Alignment.topCenter,
            ),
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
                SizedBox(height: 20),
                campo('Nombre', _nombreController),
                SizedBox(height: 10),
                campo('Apellido', _apellidoController),
                SizedBox(height: 10),
                campo('Correo', _correoController),
                SizedBox(height: 10),
                campo('Password', _passwordController),
                SizedBox(height: 10),
                botonRegistrar(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget campo(String label, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      child: Container(
        width: 300,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            icon: Icon(label == 'Password' ? Icons.lock : Icons.person),
          ),
          obscureText: label == 'Password',
        ),
      ),
    );
  }

  Widget botonRegistrar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () {
          if (_nombreController.text.isNotEmpty &&
              _apellidoController.text.isNotEmpty &&
              _correoController.text.isNotEmpty &&
              _passwordController.text.isNotEmpty) {
            _registrar(context);
          } else {
            // Mostrar algún mensaje de error indicando que todos los campos deben estar llenos
          }
        },
        child: Text('Registrar'),
      ),
    );
  }
}
