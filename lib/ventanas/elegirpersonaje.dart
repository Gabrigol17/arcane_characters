import 'package:flutter/material.dart';
import 'detallePersonaje.dart';

class ElegirPersonaje extends StatelessWidget {
  final List<Map<String, dynamic>> personajes = [
    {"id": 1, "nombre": "Jinx", "Imagen": "https://64.media.tumblr.com/78411484e1aeaf703fa55a0443be1ace/179492f242b58287-51/s400x600/d34a9909f58b4722a60cdc4f73b76d07a6822859.jpg"},
    {"id": 2, "nombre": "Ekko", "Imagen": "https://pbs.twimg.com/media/EITebF0XUAEXFzg?format=jpg&name=large"},
    {"id": 3, "nombre": "Vi", "Imagen": "https://pbs.twimg.com/media/F3mJoNCWgAAXu79.jpg"},
    {"id": 4, "nombre": "Caitlyn", "Imagen": "https://ddragon.leagueoflegends.com/cdn/img/champion/tiles/Caitlyn_50.jpg"},
    {"id": 5, "nombre": "Jayce", "Imagen": "https://i.redd.it/ls5tufd3ueib1.jpg"},
    {"id": 6, "nombre": "Silco", "Imagen": "https://pbs.twimg.com/media/F6tcTSQXMAA_n0C.png"},
    {"id": 7, "nombre": "Vander/Warwick", "Imagen": "https://i.redd.it/ttecpls4ccib1.jpg"},
    {"id": 8, "nombre": "Mel", "Imagen": "https://ddragon.leagueoflegends.com/cdn/img/champion/tiles/Mel_0.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: 
      AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Seleccionar un Personaje', 
          style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
          body: Center(
            child: Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: personajes.map((personaje) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetallePersonaje(id: personaje['id']),
                    ),
                  );
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(personaje['Imagen']),
                    ),
                    SizedBox(height: 10),
                    Text(
                      personaje['nombre'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(
          )
          ),
          )
    );
  }
  }
    
    