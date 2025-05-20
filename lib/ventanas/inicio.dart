import 'package:arcane_characters/ventanas/bloc/audio_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://upload.wikimedia.org/wikipedia/commons/f/f2/Arcane_Title_Text.png'),
            const SizedBox(height: 20),
            Text(
              'Arcane Characters',
              style: TextStyle(
                color: Colors.pinkAccent,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.black,
              ),
              child: Text('Ver personajes'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<AudioBloc>().add(AudioControlEvent(AudioAction.play));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.black,
              ),
              child: Text('Reproducir Intro Arcane'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
            onPressed: () {
              context.read<AudioBloc>().add(AudioControlEvent(AudioAction.stop));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              foregroundColor: Colors.black,
            ),
            child: Text('Detener música'),
),
          ],
        ),
      ),
    );
  }
}
