import 'package:flutter/material.dart';
import 'package:psicolbienestar/services/categoriaService.dart';
import 'package:psicolbienestar/models/categoria.dart';
import 'package:psicolbienestar/pages/detallesCategoriaPage.dart';




import 'package:psicolbienestar/widgets/EditarCategoriaPage.dart';




class CategoriaApi extends StatefulWidget {
  @override
  _CategoriaApiState createState() => _CategoriaApiState();
}

class _CategoriaApiState extends State<CategoriaApi> {
  final CategoriaService categoriaService = CategoriaService();
  late List<Categoria> categorias;
  Categoria? categoriaSeleccionada;

  @override
  void initState() {
    super.initState();
    categorias = [];
   // Llama al método para cargar las categorías al inicializar el estado
  }

  void actualizarCategoriaSeleccionada(Categoria categoria) {
    setState(() {
      categoriaSeleccionada = categoria;
    });
  }

  Future<void> _loadCategorias() async {
    try {
      final List<Categoria> categoriasActualizadas =
          await categoriaService.getCategorias();
      setState(() {
        categorias = categoriasActualizadas;
      });
    } catch (e) {
      print('Error al cargar las categorías: $e');
    }
  }

  Future<void> _eliminarCategoria(Categoria categoria) async {
    try {
      await categoriaService.eliminarCategoria(categoria.idCategoria);
      final List<Categoria> categoriasActualizadas =
          await categoriaService.getCategorias();
      setState(() {
        categorias.clear();
        categorias.addAll(categoriasActualizadas);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Categoría eliminada correctamente'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al eliminar la categoría: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Categoria>>(
      future: categoriaService.getCategorias(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error al obtener las categorías');
        } else {
          final List<Categoria> categoriasSnapshot = snapshot.data ?? [];
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: ScrollPhysics(),
            child: Row(
              children: categoriasSnapshot
                  .map((categoria) => _buildCategoriaCard(context, categoria))
                  .toList(),
            ),
          );
        }
      },
    );
  }

 Widget _buildCategoriaCard(BuildContext context, Categoria categoria) {
    return GestureDetector(
      onTap: () {
       Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesCategoriaPage(categoria: categoria)

      ),
    );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.5),
              spreadRadius: 0.1,
              blurRadius: 19,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(10),
              child: SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      child: Image.network(
                        categoria.imagen!,
                        height: 170,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categoria.nombre,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 17, 210, 52),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            categoria.descripcion,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: PopupMenuButton(
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Cierra el menú
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditarCategoriaPage(categoria: categoria, categoriaService: categoriaService),

                          ),
                        );
                      },
                      child: ListTile(
                        leading: Icon(Icons.edit),
                        title: Text('Editar'),
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Eliminar'),
                      onTap: () => _eliminarCategoria(
                          categoria), // Llama al método para eliminar la categoría
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
