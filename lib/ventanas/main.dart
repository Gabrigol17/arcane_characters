import 'package:flutter/material.dart';
void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arcane App',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image(image: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/f/f2/Arcane_Title_Text.png')
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}