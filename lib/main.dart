import 'package:flutter/material.dart';
import 'package:mobile_game/views/home.dart';
import 'package:mobile_game/views/rules.dart';
import 'package:mobile_game/views/scores.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Android Game'),
      initialRoute: '/',
      routes: {
        '/jouer': (context) =>  MyHomePage(title: 'Jouer'),
        '/scores': (context) =>  SomeDataView(data: {'name': 'Arthur', 'age': 25}),
        '/regles': (context) =>  RulesPage(title: 'Règles'),
      },
    );
  }
}