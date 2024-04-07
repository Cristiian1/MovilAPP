import 'package:flutter/material.dart';
import 'package:psicolbienestar/auth/home.dart';
import 'package:psicolbienestar/pages/HomePage.dart';
import 'package:psicolbienestar/widgets/input_text_login.dart';

class LoginForm extends StatefulWidget {
  LoginForm({required Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // codigo  para apis validacion de datos
  String _email = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: <Widget>[
        InputText(
          hint: 'ingrese correo',
          label: 'Ingresa Email',
          keyboard: TextInputType.emailAddress,
          icono: Icon(Icons.verified_user),
          onChanged: (data) {
            _email = data;
          },
          validate: (data) {
            if (data != null && !data.contains('@')) {
              return "correo invalido";
            }
            return null;
          },
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

        InputText(
          hint: 'passsword',
          label: 'Ingrese password',

          obscure: true,
          icono: Icon(Icons.lock_outline),
          validate: (data) {
            if (data?.trim().isEmpty ?? true) {
              return 'Invalid password';
            }
            return null;
          },
        ),
      Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
                          // conectar vistas de widget 
                          onPressed: () {
                            final route = MaterialPageRoute(
                            builder: (context) => HomePageCategoria());
                            Navigator.push(context, route);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 7, 45, 235),
                          ),
                          child: Text(
                            'Iniciar',
                            style: TextStyle(
                              color: Color.fromARGB(255, 229, 231, 232),
                            ),
                          ),
                        ),
        ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
              'Para fortalecer tu salud mental',
              style: TextStyle(
              color: Colors.white,
              ),
            textAlign: TextAlign.center,
            ),
          ],
        )
      ],
    ));
  }
}
