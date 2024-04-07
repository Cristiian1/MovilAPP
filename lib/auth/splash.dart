import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:psicolbienestar/auth/login.dart';
// import 'package:psicolbienestar/pages/HomePage.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Stack(
        children: [
          Center(
            // Imagen animada en movimiento
            child: Lottie.asset("assets/lottie/Animation - 1709037189179.json"),
          ),
          Positioned(
            top: 0, // Ajusta la posición vertical de la imagen
            left: 0, // Ajusta la posición horizontal de la imagen
            right: 160, // Ajusta la posición horizontal de la imagen
            child: Image.asset(
              'images/logofinal.png', // Ruta de tu imagen
              width: 110, // Ajusta el tamaño según tu necesidad
              height: 110, // Ajusta el tamaño según tu necesidad
            ),
          ),
        ],
      ),
      nextScreen: LoginScreen(),
      splashIconSize: 600, // Tamaño de la animación
    backgroundColor: Color.fromARGB(248, 252, 252, 252),
    );
  }
}
