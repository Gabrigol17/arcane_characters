import 'package:flutter/material.dart';
import 'detallePersonaje.dart';

class ElegirPersonaje extends StatelessWidget {
  final List<Map<String, dynamic>> personajes = [
    {"id": 1, "nombre": "Jinx"},
    {"id": 2, "nombre": "Ekko"},
    {"id": 3, "nombre": "Vi"},
    {"id": 4, "nombre": "Caitlyn"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Seleccionar Personaje")),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        itemCount: personajes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.3,
        ),
        itemBuilder: (context, index) {
          final personaje = personajes[index];

          return ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetallePersonaje(id: personaje['id']),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Colors.deepPurple,
            ),
            child: Text(
              personaje['nombre'],
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
