import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class SomeWidget extends StatelessWidget {
  final LocalStorage storage = new LocalStorage('some_key');

  SomeWidget() {
    _addDataToLocalStorage();
  }

  void _addDataToLocalStorage() async {
    await storage.ready;
    storage.setItem('key', {'name': 'Arthur', 'age': 25});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: storage.ready,
      builder: (BuildContext context, snapshot) {
        if (snapshot.data == true) {
          Map<String, dynamic> data = storage.getItem('key');

          return SomeDataView(data: data);
        } else {
          return SomeLoadingStateWidget();
        }
      },
    );
  }
}

class SomeDataView extends StatelessWidget {
  final Map<String, dynamic> data;

  SomeDataView({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('Name: ${data['name']}'),
          Text('Age: ${data['age']}'),
        ],
      ),
    );
  }
}

class SomeLoadingStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ici, vous pouvez retourner un widget qui indique que les données sont en cours de chargement.
    // Pour l'instant, je vais juste retourner un widget CircularProgressIndicator.
    return CircularProgressIndicator();
  }
}
final storage = new LocalStorage('./json/my_data.json');