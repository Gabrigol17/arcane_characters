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
  final url = Uri.parse('https://run.mocky.io/v3/a56f3c8b-656b-4536-93d8-1e83376bed1c');

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
    throw Exception('Error al cargar personaje');
  }
}
