// id, nombre, alias, rol, region, descripcion, 
//habilidades[], apariciones[], actor_Voz,imagen.
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Character {
  final int id;
  final String nombre;
  final String imagen;
  final String alias;
  final String descripcion;

  Character({
    required this.id,
    required this.nombre,
    required this.imagen,
    required this.alias,
    required this.descripcion,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      nombre: json['nombre'],
      imagen: json['imagen'],
      alias: json['apodo'],
      descripcion: json['historia'],
    );
  }
}
Future<Character?> buscarpersonaje(int id) async {
  final url = Uri.parse('https://run.mocky.io/v3/602aaee2-4cc3-43fb-9c57-8b7e142b6a93');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    try {
      final personajeData = data.firstWhere((item) => item['id'] == id);
      return Character.fromJson(personajeData);
    } catch (error) {
      return null; 
    }
  } else {
    throw Exception('Error al cargar personaje');
  }
}
