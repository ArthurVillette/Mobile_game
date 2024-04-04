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
    if (_scores == null) {
      return const Center(child: CircularProgressIndicator());
    }

    var sortedEntries = _scores!.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scores'),
      ),
      body: _scores!.isNotEmpty
          ? ListView.builder(
              itemCount: sortedEntries.length,
              itemBuilder: (context, index) {
                var entry = sortedEntries[index];
                return ListTile(
                  title: Text(entry.key),
                  subtitle: Text('Score: ${entry.value}'),
          );
        },
      )
          : const Center(
              child: Text('Aucun score enregistré.'),
      ),
    );
  }
}
