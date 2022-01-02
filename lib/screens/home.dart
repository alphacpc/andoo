import 'package:andoo/screens/details.dart';
import 'package:andoo/models/LeaderType.dart';
import 'package:flutter/material.dart';

class TodosScreen extends StatelessWidget {
  TodosScreen({Key? key, required this.leaders}) : super(key: key);

  final List<Leader> leaders;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('andoo'),
      ),
      body: ListView.builder(
        itemCount: leaders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(leaders[index].leaderLname),
            // When a user taps the ListTile, navigate to the DetailScreen.
            // Notice that you're not only creating a DetailScreen, you're
            // also passing the current todo through to it.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(leader: leaders[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
