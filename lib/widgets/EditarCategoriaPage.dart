import 'package:flutter/material.dart';
import 'package:psicolbienestar/models/categoria.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:psicolbienestar/services/categoriaService.dart';

class EditarCategoriaPage extends StatefulWidget {
  final Categoria categoria;
  final CategoriaService categoriaService;

  EditarCategoriaPage({required this.categoria, required this.categoriaService});

  @override
  _EditarCategoriaPageState createState() => _EditarCategoriaPageState();
}

class _EditarCategoriaPageState extends State<EditarCategoriaPage> {
  late File _imagenFile;
  final _formKey = GlobalKey<FormState>();
  late String _nombre;
  late String _descripcion;

  @override
  void initState() {
    super.initState();
    _imagenFile = File(widget.categoria.imagen);
    _nombre = widget.categoria.nombre;
    _descripcion = widget.categoria.descripcion;
  }

  void actualizarCategorias() async {
    try {
      final List<Categoria> categoriasActualizadas = await widget.categoriaService.getCategorias();
      setState(() {
        widget.categoriaService.categorias = categoriasActualizadas; // Corrección aquí
      });
    } catch (e) {
      print('Error al actualizar las categorías: $e');
    }
  }

  Future<void> _seleccionarImagen() async {
    final picker = ImagePicker();
    final imagenSeleccionada = await picker.pickImage(source: ImageSource.gallery);
    if (imagenSeleccionada != null) {
      setState(() {
        _imagenFile = File(imagenSeleccionada.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Categoría'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    initialValue: _nombre,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa el nombre';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _nombre = value!;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    initialValue: _descripcion,
                    decoration: InputDecoration(
                      labelText: 'Descripción',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa la descripción';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _descripcion = value!;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _seleccionarImagen,
                    child: Text('Seleccionar Imagen'),
                  ),
                  SizedBox(height: 10),
                  _imagenFile != null && _imagenFile.path.isNotEmpty
                      ? Container(
                          height: 100, // Ajusta la altura según tus necesidades
                          width: 100, // Ajusta la anchura según tus necesidades
                          child: Image.file(
                            _imagenFile,
                            fit: BoxFit.cover, // Ajusta el tamaño de la imagen
                          ),
                        )
                      : SizedBox(), // Mostrar la imagen seleccionada si existe
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        final nuevaCategoria = Categoria(
                          idCategoria: widget.categoria.idCategoria,
                          nombre: _nombre,
                          descripcion: _descripcion,
                          imagen: '', // Deberías manejar la ruta de la imagen adecuadamente
                        );
                        await widget.categoriaService.actualizarCategoria(nuevaCategoria, _imagenFile);
                       
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Guardar cambios'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
