import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/characterbloc_bloc.dart';

class DetallePersonaje extends StatelessWidget {
  final int id;

  const DetallePersonaje({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: const Text('Detalle del Personaje'),
        backgroundColor: Colors.blueAccent,
      ),
      body: BlocProvider(
        create: (context) => CharacterblocBloc()..add(LoadCharacterEvent(id)),
        child: BlocBuilder<CharacterblocBloc, CharacterblocState>(
          builder: (context, state) {
            if (state is CharacterblocLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CharacterblocSuccess) {
              final personaje = state.personaje!;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        personaje.nombre,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (personaje.imagen != null)
                        Image.network(
                          personaje.imagen!,
                          height: 200,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.image_not_supported, size: 100),
                        ),
                      const SizedBox(height: 20),
                      Text(
                        personaje.descripcion ?? 'Sin descripción.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is CharacterblocFailure) {
              return Center(child: Text(state.mensajeError ?? 'Error.'));
            } else {
              return const Center(child: Text('Selecciona un personaje.'));
            }
          },
        ),
      ),
    );
  }
}
