import 'package:flutter/material.dart';
import '../game/devine_nombre.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const NumberGuessingGameScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Jouer',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.blueAccent,
        backgroundColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/jouer');
                },
                child: Text('Jouer'),
              ),
            ],
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/scores');
                },
                child: Text('Scores'),
              ),
            ],
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/regles');
                },
                child: Text('Règles'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
