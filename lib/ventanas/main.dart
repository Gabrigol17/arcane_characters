import 'package:arcane_characters/ventanas/inicio.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/audio_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arcane App',
      home: BlocProvider(
        create: (_) => AudioBloc(),
        child: Inicio(),
      ),
    );
  }
}


  