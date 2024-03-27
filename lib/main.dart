import 'package:flutter/material.dart';
import 'package:mobile_game/game/devine_nombre.dart';
import 'package:mobile_game/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Android Game'),
        '/name': (context) => const NameEntryScreen(),
        '/jouer': (context) => const NumberGuessingGameScreen(),
        '/scores': (context) => const MyHomePage(title: 'Scores'),
        '/regles': (context) => const MyHomePage(title: 'Règles'),
      },
    );
  }
}
