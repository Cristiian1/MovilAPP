import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:psicolbienestar/widgets/HomeAppBar.dart';
import 'package:psicolbienestar/widgets/ItemBottonBar.dart';
import 'package:psicolbienestar/widgets/recursosWidget.dart';
import 'package:psicolbienestar/widgets/categoriaApi.dart';

import '../widgets/HomoBottomBar.dart';
import '../widgets/ProfesionalesWidget.dart';

class HomePageCategoria extends StatefulWidget {
  final bool scrollToProfessionals;
  final bool scrollToRecursos;

  const HomePageCategoria({Key? key, this.scrollToProfessionals = false, this.scrollToRecursos = false}) : super(key: key);

  @override
  _HomePageCategoriaState createState() => _HomePageCategoriaState();
}

class _HomePageCategoriaState extends State<HomePageCategoria> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (widget.scrollToProfessionals) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _scrollToProfessionals();
      });
    } else if (widget.scrollToRecursos) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _scrollToRecursos();
      });
    }
  }

  void _scrollToProfessionals() {
    _scrollController.animateTo(
      MediaQuery.of(context).size.height, // Ajusta este valor según la posición de la sección de profesionales
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToRecursos() {
    _scrollController.animateTo(
      MediaQuery.of(context).size.height * 2, // Ajusta este valor según la posición de la sección de recursos
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Widget buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 5),
            height: 50,
            width: 300,
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Buscar...",
              ),
            ),
          ),
          Spacer(),
          Icon(
            Icons.camera_alt,
            size: 27,
            color: Color(0xff475269),
          ),
        ],
      ),
    );
  }

  Widget buildCategorySection() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 15, left: 100),
          child: Text(
            "Categorias",
            style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 2, 79, 245),
            ),
          ),
        ),
        CategoriaApi(),
      ],
    );
  }

  Widget buildResourcesSection() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 10, bottom: 10),
          child: Text(
            " Recursos Educativos",
            style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 2, 79, 245),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 10, bottom: 10),
          child: Text(
            "Aquí encontraras  más sobre tu bienestar. No todos aprenden de la misma manera, por eso explora diferentes formas de aprender.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        RecursosWidget(),
      ],
    );
  }

  Widget buildProfessionalsSection() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 10, bottom: 10),
          child: Text(
            " Profesionales",
            style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 17, 210, 52),
            ),
          ),
        ),
        ProfesionalesWidget(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: _scrollController,
        children: [
          HomeAppBar(),
          Container(
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xffedecf2),
            ),
            child: Column(
              children: [
                buildSearchBar(),
                buildCategorySection(),
                SizedBox(height: 20),
                buildResourcesSection(),
                SizedBox(height: 20),
                buildProfessionalsSection(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ItemBottonBar(),
    );
  }
}
