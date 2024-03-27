import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const NumberGuessingGame());
}

class NumberGuessingGame extends StatelessWidget {
  const NumberGuessingGame({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jeu de Devine le Nombre',
      initialRoute: '/name',
      routes: {
        '/name': (context) => const NameEntryScreen(),
        '/game': (context) => const NumberGuessingGameScreen(),
      },
    );
  }
}

class NameEntryScreen extends StatefulWidget {
  const NameEntryScreen({Key? key});

  @override
  _NameEntryScreenState createState() => _NameEntryScreenState();
}

class _NameEntryScreenState extends State<NameEntryScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrez Votre Nom'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Entrez votre nom',
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  String name = _nameController.text.trim();
                  if (name.isNotEmpty) {
                    Navigator.pushNamed(context, '/jouer', arguments: name);
                  }
                },
                child: const Text('Commencer le Jeu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NumberGuessingGameScreen extends StatefulWidget {
  const NumberGuessingGameScreen({Key? key});

  @override
  _NumberGuessingGameScreenState createState() => _NumberGuessingGameScreenState();
}

class _NumberGuessingGameScreenState extends State<NumberGuessingGameScreen> {
  final _random = Random();
  late int _targetNumber;
  late int _maxNumber;
  int? _userGuess;
  String _resultText = '';
  int _level = 1;
  int _attemptsPerLevel = 5;
  int _remainingAttempts = 0;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    _maxNumber = _maxNumberForLevel();
    _targetNumber = _random.nextInt(_maxNumber) + 1;
    _userGuess = null;
    _remainingAttempts = _attemptsPerLevel;
  }

  int _maxNumberForLevel() {
    return 10 * _level;
  }

  void _checkGuess() {
    if (_userGuess != null) {
      _remainingAttempts--;
      if (_userGuess == _targetNumber) {
        _resultText = 'Félicitations! Vous avez deviné le bon nombre ($_targetNumber)';
        _level++;
        _attemptsPerLevel += 1;
        _startNewGame();
      } else if (_remainingAttempts <= 0) {
        _resultText = 'Vous avez épuisé toutes vos tentatives. Le bon nombre était $_targetNumber.';
      } else if (_userGuess! < _targetNumber) {
        _resultText = 'Le nombre est plus grand';
      } else {
        _resultText = 'Le nombre est plus petit';
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    String playerName = ModalRoute.of(context)?.settings.arguments as String? ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Text('Jeu de Devine le Nombre - Niveau $_level'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Bienvenue, $playerName!',
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Devinez le nombre entre 1 et $_maxNumber. Tentatives restantes : $_remainingAttempts',
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 20.0),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _userGuess = int.tryParse(value);
                  });
                },
                onSubmitted: (_) => _checkGuess(),
                decoration: const InputDecoration(
                  hintText: 'Entrez votre estimation',
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _checkGuess,
                child: const Text('Soumettre'),
              ),
              const SizedBox(height: 20.0),
              Text(
                _resultText,
                style: const TextStyle(fontSize: 20.0),
              ),
              if (_remainingAttempts <= 0)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _startNewGame();
                    });
                  },
                  child: const Text('Nouvelle Partie'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
