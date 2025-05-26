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
  Widget build(BuildContext context){
    return BlocProvider(
      create: (_) => CharacterblocBloc()..add(LoadCharacterEvent(id)),
      child: BlocBuilder<CharacterblocBloc, CharacterblocState>(
        builder: (context, state) { 
          if (state is CharacterblocLoading) {
            return PantallaCargando();
          } else if (state is CharacterblocSuccess){
            final personajefinal = state.personaje;
            return Scaffold(
              body: Stack(
                 children: [
                  Image.network('https://static1.colliderimages.com/wordpress/wp-content/uploads/2022/01/Memorable-Moments-From-Arcane.jpg?q=70&fit=contain&w=1200&h=628&dpr=1', 
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity),
                  Container(
                    color: Colors.black.withOpacity(0.6),),
                    SafeArea(
                      child: 
                      Center(
                        child: 
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24.0),
                              child:  Image.network(
                                personajefinal!.imagen,
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover
                                ),
                            ),
                            SizedBox(height: 23.0),
                            Text(personajefinal.nombre,
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                            ),
                            SizedBox(height: 10.0),
                            Text(personajefinal.descripcion,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white
                                ),
                                textAlign: TextAlign.center,
                                ),
                            SizedBox(height: 10,),
                            IconButton(
                              icon: Icon(Icons.arrow_back, color: Colors.red
                                ),
                                onPressed: () {
                                Navigator.of(context).pop();
                                },
                            )
                          ],
                        ),)) 
                 ],
              ),
            );
          } else {
            return PantallaFailure();
          }
        },
    )
    );
  }
}
