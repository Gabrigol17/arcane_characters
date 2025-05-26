import 'package:arcane_characters/bloc/characterbloc_bloc.dart';
import 'package:arcane_characters/personajes/personaje.dart';
import 'package:arcane_characters/ventanas/pantallacargando.dart';
import 'package:arcane_characters/ventanas/pantallafailure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DetallePersonaje extends StatelessWidget {
  final int id;

  const DetallePersonaje({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CharacterblocBloc()..add(LoadCharacterEvent(id)),
      child: BlocBuilder<CharacterblocBloc, CharacterblocState>(
        builder: (context, state) {
          if (state is CharacterblocLoading) {
            return PantallaCargando();
          } else if (state is CharacterblocSuccess) {
            final personajefinal = state.personaje;
            return Scaffold(
              body: Stack(
                children: [
                  Image.network(
                    'https://wiki.leagueoflegends.com/en-us/images/Piltover_Arcane_02.jpg?d7915',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                  SafeArea(
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(24),
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(24.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 10.0,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24.0),
                              child: Image.network(
                                personajefinal!.imagen,
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 23.0),
                            Text(
                              personajefinal.nombre,
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              personajefinal.descripcion,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return PantallaFailure();
          }
        },
      ),
    );
  }
}
