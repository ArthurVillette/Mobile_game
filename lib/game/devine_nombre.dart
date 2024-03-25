import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const NumberGuessingGame());
}

class NumberGuessingGame extends StatelessWidget {
  const NumberGuessingGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Guessing Game',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Number Guessing Game'),
        ),
        body: const NumberGuessingGameScreen(),
      ),
    );
  }
}

class NumberGuessingGameScreen extends StatefulWidget {
  const NumberGuessingGameScreen({super.key});

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
  final int _attemptsPerLevel = 5;
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
        _resultText = 'Bravo! Vous avez deviné le bon nombre ($_targetNumber)';
        _level++;
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Niveau: $_level', // Afficher le niveau actuel
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              'Devinez le nombre entre 1 et $_maxNumber. Essais restants: $_remainingAttempts',
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
                hintText: 'Entrez votre nombre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _checkGuess,
              child: const Text('Valider'),
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
    );
  }
}
