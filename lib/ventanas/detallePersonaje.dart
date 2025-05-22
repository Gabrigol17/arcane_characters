import 'package:arcane_characters/bloc/characterbloc_bloc.dart';
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
          if (state is CharacterblocSuccess) {
            final personaje = state.personaje!;
            return Scaffold(
              body: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://imgs.search.brave.com/y8G0-rkQTmDtdgFG4Lyd3h78Vt0HXetQVCX5TOYfSWQ/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMxLnNyY2RuLmNv/bS93b3JkcHJlc3Mv/d3AtY29udGVudC91/cGxvYWRzLzIwMjQv/MTAvcGlsdG92ZXIt/aW4tdGhlLWZpcnN0/LXNlYXNvbi1vZi1h/cmNhbmUuanBn',
                    fit: BoxFit.cover,
                  ),
                  Container(color: Colors.black.withOpacity(0.4)),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          personaje.nombre,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [Shadow(blurRadius: 3, color: Colors.black)],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Image.network(
                          personaje.imagen ?? '',
                          height: 200,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.broken_image, size: 80, color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            personaje.descripcion ?? 'Sin descripción.',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              shadows: [Shadow(blurRadius: 3, color: Colors.black)],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(), 
              ),
            );
          }
        },
      ),
    );
  }
}
