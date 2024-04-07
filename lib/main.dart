import 'package:flutter/material.dart';
import 'package:psicolbienestar/auth/Registro.dart';
import 'package:psicolbienestar/auth/home.dart';
import 'package:psicolbienestar/auth/login.dart';
import 'package:psicolbienestar/auth/splash.dart';
import 'package:psicolbienestar/services/categoriaService.dart';
import 'package:psicolbienestar/pages/detallesCategoriaPage.dart';

import 'package:psicolbienestar/pages/HomePage.dart';
import 'package:psicolbienestar/pages/TareaCategoriaPage.dart';

import 'package:psicolbienestar/pages/detallesPage.dart';
import 'package:psicolbienestar/widgets/recursosWidget.dart';
import 'package:psicolbienestar/pages/AgregarCategoriaPage%20.dart';
import 'package:psicolbienestar/pages/CategoriaCrudPage.dart';
import 'package:psicolbienestar/models/categoria.dart';
import 'package:psicolbienestar/models/tareas.dart';
void main() {
  Categoria categoria = Categoria(
      idCategoria: 1,
      nombre: '',
      descripcion: '',
      imagen: ''); // Define la instancia de la categoría
  CategoriaService categoriaService =
      CategoriaService(); 
      String idTarea = '1'; // Define la instancia del servicio de categoría
    runApp(MyApp(
      categoria: categoria,
      categoriaService: categoriaService,
      idTarea: idTarea)); // Pasa idTarea al constructor de MyApp

}

class MyApp extends StatelessWidget {
  final Categoria categoria; // Declara la variable categoria
  final CategoriaService
      categoriaService; // Declara la variable categoriaService
  final String idTarea;
  MyApp(
      {required this.categoria,
      required this.categoriaService,
      required this.idTarea}); // Constructor// Constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 242, 247, 252),
      ),
      initialRoute: 'Splash',
      routes: {
        'Splash': (BuildContext context) => Splash(key: UniqueKey()),
        "login": (context) => LoginScreen(),
        "detallesPage": (context) => DetallesPage(),
       "TareaCategoria": (context) => TareaCategoriaPage(idTarea: 1),

       "/detallesCategoria": (context) => DetallesCategoriaPage(
            categoria: categoria),
        'Home': (BuildContext context) => HomePage(key: UniqueKey()),
        'login': (BuildContext context) => HomePageCategoria(key: UniqueKey()),
        'registro': (BuildContext context) => RegistroScreen(key: UniqueKey()),
        "agregarCategoria": (context) => AgregarCategoriaPage(),
        "crudCategoria": (context) => CategoriaCrudPage(),
      },
    );
  }
}
