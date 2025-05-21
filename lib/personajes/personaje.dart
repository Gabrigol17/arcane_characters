// id, nombre, alias, rol, region, descripcion, 
//habilidades[], apariciones[], actor_Voz,imagen.
import 'dart:convert';
import 'package:http/http.dart' as http;

class Character {
  final int id;
  final String nombre;
  final String imagen;
  final String descripcion;

  Character({
    required this.id,
    required this.nombre,
    required this.imagen,
    required this.descripcion,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      nombre: json['nombre'],
      imagen: json['imagen'],
      descripcion: json['descripcion'],
    );
  }
}
Future<Character?> buscarpersonaje(int id) async {
  final url = Uri.parse('https://run.mocky.io/v3/5270cb7f-8fec-4993-8c62-60ef5050bbfe');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    final personajeData = data.firstWhere(
      (item) => item['id'] == id,
      orElse: () => null,
    );

    if (personajeData != null) {
      return Character.fromJson(personajeData);
    } else {
      return null; 
    }
  } else {
    throw Exception('Error al obtener datos del servidor');
  }
}
