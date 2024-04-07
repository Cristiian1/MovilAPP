import 'package:flutter/material.dart';
import 'package:psicolbienestar/auth/home.dart';
import 'package:psicolbienestar/auth/login.dart';
import 'package:psicolbienestar/pages/HomePage.dart';
import 'package:psicolbienestar/widgets/formulario_login.dart';
import 'package:psicolbienestar/widgets/input_text_login.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({required Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  // codigo  para apis validacion de datos
  String _email = '';
  // String _password = '';
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: <Widget>[
        InputText(
          hint: 'Nombre',
          label: 'Ingrese Nombre',
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
        InputText(
          hint: 'Apellido',
          label: 'Apellido',
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
        InputText(
          hint: 'Correo eletronico',
          label: 'Correo eletronico',
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),
        Text(
          'Al hacer clic en "Registrarte", aceptas nuestras Condiciones, la Política de privacidad y la Política de cookies. Es posible que te enviemos notificaciones por SMS, que puedes desactivar cuando quieras.',
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            // conectar vistas de widget
            onPressed: () {
              Navigator.pushNamed(context, 'login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 7, 45, 235),
            ),
            child: Text(
              'Registrarte',
              style: TextStyle(
                color: Color.fromARGB(255, 229, 231, 232),
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '¿Ya tienes cuenta?',
              style: TextStyle(),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                final route = MaterialPageRoute(
                  builder: (context) => LoginScreen(key: UniqueKey()),
                );
                Navigator.push(context, route);
              },
              child: Text(
                'Entrar',
                style: TextStyle(
                  color: const Color.fromARGB(255, 228, 231, 234),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
