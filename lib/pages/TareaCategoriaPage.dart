import 'package:flutter/material.dart';
import 'package:psicolbienestar/services/tareasService.dart';
import 'package:psicolbienestar/models/tareas.dart';

class TareaCategoriaPage extends StatefulWidget {
  final int idTarea;

  const TareaCategoriaPage({Key? key, required this.idTarea}) : super(key: key);

  @override
  _TareaCategoriaPageState createState() => _TareaCategoriaPageState();
}

class _TareaCategoriaPageState extends State<TareaCategoriaPage> {
  final TareaService tareaService = TareaService();
  late Tarea tarea;
  late TextEditingController respuesta1Controller;
  late TextEditingController respuesta2Controller;

  @override
  void initState() {
    super.initState();
    // Inicializar los controladores de texto
    respuesta1Controller = TextEditingController();
    respuesta2Controller = TextEditingController();
    // Cargar la tarea
    _loadTarea();
  }

  @override
  void dispose() {
    // Liberar los controladores de texto
    respuesta1Controller.dispose();
    respuesta2Controller.dispose();
    super.dispose();
  }

  Future<void> _loadTarea() async {
    try {
      final loadedTarea = await tareaService.getTarea(widget.idTarea);
      setState(() {
        if (loadedTarea != null) {
          tarea = loadedTarea;
          // Manejar respuestas nulas antes de asignarlas a los controladores de texto
          respuesta1Controller.text = tarea.respuesta1 ?? ''; // Asignar cadena vacía si la respuesta es nula
          respuesta2Controller.text = tarea.respuesta2 ?? ''; // Asignar cadena vacía si la respuesta es nula
        } else {
          print('La tarea cargada es nula');
        }
      });
    } catch (e) {
      print('Error al cargar la tarea: $e');
    }
  }

  Future<void> _submitForm() async {
    try {
      // Enviar las respuestas actualizadas a la API
      await tareaService.enviarRespuestas(
        widget.idTarea,
        respuesta1Controller.text,
        respuesta2Controller.text,
      );
      // Mostrar un mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Respuestas enviadas correctamente'),
        ),
      );
    } catch (e) {
      // Manejar el error al enviar las respuestas
      print('Error al enviar las respuestas: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (tarea == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Tarea: ${tarea.nombre}'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Aquí agregamos la imagen de portada
              Image.asset(
                'images/tarea2.jpg',
                height: 100, // Ajusta la altura según tu diseño
                fit: BoxFit.cover, // Ajusta la forma en que la imagen se ajusta al contenedor
              ),
              SizedBox(height: 20.0),
              Text(
                tarea.descripcion,
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              _buildRespuestaFormField(tarea.pregunta1, respuesta1Controller),
              SizedBox(height: 20.0),
              _buildRespuestaFormField(tarea.pregunta2, respuesta2Controller),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Enviar Respuestas'),
              ),
              SizedBox(height: 20.0),
              // Aquí agregamos el botón "Siguiente Actividad"
              ElevatedButton(
                onPressed: () {
                  // Aquí puedes agregar la lógica para ir a la siguiente actividad
                },
                child: Text('Siguiente Actividad'),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildRespuestaFormField(String labelText, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
