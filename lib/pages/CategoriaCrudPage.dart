import 'package:flutter/material.dart';
import 'package:psicolbienestar/services/categoriaService.dart';
import 'package:psicolbienestar/models/categoria.dart';


class CategoriaCrudPage extends StatefulWidget {
  @override
  _CategoriaCrudPageState createState() => _CategoriaCrudPageState();
}

class _CategoriaCrudPageState extends State<CategoriaCrudPage> {
  final categoriaService = CategoriaService();
  final _formKey = GlobalKey<FormState>();
  String? _nombre;
  String? _descripcion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operaciones CRUD de Categorías'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, ingresa un nombre';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nombre = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descripción'),
                onSaved: (value) {
                  _descripcion = value;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    final nuevaCategoria = Categoria(
                      idCategoria: 0, // Asigna el ID correcto según tu lógica
                      nombre: _nombre!,
                      descripcion: _descripcion!,
                      imagen: 'ruta_de_la_imagen.jpg',
                    );
                    // await categoriaService.agregarCategoria(nuevaCategoria);
                    Navigator.pop(context); // Regresar a la pantalla anterior
                  }
                },
                child: Text('Guardar'),
              ),
           
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar a la pantalla de creación
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
