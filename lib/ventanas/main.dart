import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arcane Characters',
      home: Scaffold(backgroundColor: const Color.fromARGB(255, 88, 21, 222) ,
        appBar: AppBar(
          title: Text('Arcane Characters'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Jinx!'),
              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5fBUhtyVjrQbj5JcdUSHDh7uwaOqEvtHK4owpmMxeuBOxvNZusyLDg8VglqzJ678N_tw&usqp=CAU'),
            ],
          ),
        ),
      ),
      );
  }
}