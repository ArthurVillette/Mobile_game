import 'package:flutter/material.dart';


class RulesPage extends StatelessWidget {
  const RulesPage({super.key});
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
            subtitle: Text('Choissisez une un nombre entre 1 et 100, le jeux vous dira si le nombre est plus grand ou plus petit que le nombre choisi et recommencez jusqu\'à trouver le bon nombre'),
          ),
          ListTile(
            title: Text('Autorisations de nombre'),
            subtitle: Text('Vous pouvez choisir un nombre entre 1 et 100 qui est  un entier naturel '),
          ),
          ListTile(
            title: Text('Rule '),
            subtitle: Text('Choose a number between 1 and 100, the game will tell you if the number is greater or less than the chosen number and start over until you find the right number'),
          ),
          ListTile(
            title: Text('Number permissions'),
            subtitle: Text('you can choose a number between 1 and 100 which is a natural number'),
          ),
        ],
      ),
    );
  }
}