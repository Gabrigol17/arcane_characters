// id, nombre, alias, rol, region, descripcion, 
//habilidades[], apariciones[], actor_Voz,imagen.
import 'dart:convert';
import 'package:http/http.dart' as http;

class Character {
  int? id;
  String? name;
  String? alias;
  String? rol;
  String? region;
  String? description;
  List<String> habilidades = [];
  List<String> apariciones = [];
  String? actorVoz;
  String? imagen;
  Character({
    this.id,
    this.name,
    this.alias,
    this.rol,
    this.region,
    this.description,
    required this.habilidades,
    required this.apariciones,
    this.actorVoz,
    this.imagen,
  });
  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['nombre'],  // Asegúrate de que coincida con tu JSON
      alias: json['alias'],
      rol: json['rol'],
      region: json['region'],
      description: json['descripcion'],
      habilidades: List<String>.from(json['habilidades']),
      apariciones: List<String>.from(json['apariciones']),
      actorVoz: json['actor_voz'],  // Cuida el casing
      imagen: json['imagen']
      );
}
}
// aqui la conversion de Http creado en Mocky a JSON

buscarpersonaje()async{
  final url = Uri.parse('https://run.mocky.io/v3/5b15899d-6078-451c-be79-96cee4189414');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final datos = jsonDecode(response.body);
    return Character.fromJson(datos);
  } else {
    print('Error al obtener el personaje: ${response.statusCode}');
    
}
}