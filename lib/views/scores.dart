import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScoresPage extends StatefulWidget {
  const ScoresPage({Key? key});

  @override
  _ScoresPageState createState() => _ScoresPageState();
}

class _ScoresPageState extends State<ScoresPage> {
  Map<String, int>? _scores;

  @override
  void initState() {
    super.initState();
    _loadScores();
  }

  Future<void> _loadScores() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _scores = {};
      prefs.getKeys().forEach((key) {
        int? score = prefs.getInt(key);
        if (score != null) {
          _scores![key] = score;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scores'),
      ),
      body: _scores != null && _scores!.isNotEmpty
          ? ListView.builder(
            itemCount: _scores!.length,
            itemBuilder: (context, index) {
              String playerName = _scores!.keys.toList()[index];
              int score = _scores![playerName]!;
              return ListTile(
                title: Text(playerName),
                subtitle: Text('Score: $score'),
          );
        },
      )
          : const Center(
              child: Text('Aucun score enregistré.'),
      ),
    );
  }
}
