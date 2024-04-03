import 'package:flutter/material.dart';


class RulesPage extends StatelessWidget {
  final String title;
  RulesPage({required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rules'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Règle'),
            subtitle: Text('Choissisez une un nombre entre 1 et 10*n (n pour niveau), le jeux vous dira si le nombre est plus grand ou plus petit que le nombre choisi et recommencez jusqu\'à trouver le bon nombre vous avez 5+n essaies '),
          ),
          ListTile(
            title: Text('Autorisations de nombre'),
            subtitle: Text('Vous pouvez choisir un nombre entre 1 et 10*n (n pour niveau) qui est  un entier naturel '),
          ),
          ListTile(
            title: Text('Rule '),
            subtitle: Text('Choose a number between 1 and 10*n (n for level), the game will tell you if the number is greater or less than the chosen number and start over until you find the right number you have 5+n tries'),
          ),
          ListTile(
            title: Text('Number permissions'),
            subtitle: Text('You can choose a number between 1 and 10*n (n for level) which is a natural number'),
          ),
        ],
      ),
    );
  }
}