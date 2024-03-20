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
  int? _userGuess;
  String _resultText = '';

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    _targetNumber = _random.nextInt(100) + 1;
    _userGuess = null;
    _resultText = '';
  }

  void _checkGuess() {
    if (_userGuess != null) {
      if (_userGuess == _targetNumber) {
        _resultText = 'Bravo! Vous avez deviné le bon nombre ($_targetNumber)';
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
            const Text(
              'Devinez le nombre entre 1 et 100',
              style: TextStyle(fontSize: 20.0),
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
            const SizedBox(height: 20.0),
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
