import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/audio_bloc.dart';
import 'package:arcane_characters/bloc/characterbloc_bloc.dart'; 
import 'package:arcane_characters/ventanas/inicio.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AudioBloc>(
          create: (_) => AudioBloc(),
        ),
        BlocProvider<CharacterblocBloc>(
          create: (_) => CharacterblocBloc(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arcane App',
      home: Inicio(),
      debugShowCheckedModeBanner: false,
    );
  }
}
