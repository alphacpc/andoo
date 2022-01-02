import 'package:andoo/models/LeaderType.dart';
import 'package:flutter/material.dart';
import 'package:andoo/models/LeaderType.dart';

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

void main() {
  runApp(
    MaterialApp(
      title: 'Passing Data',
      home: TodosScreen(
        todos: List.generate(
          20,
          (i) => Todo(
            'Todo $i',
            'A description of what needs to be done for Todo $i',
          ),
        ),
      ),
    ),
  );
}

class TodosScreen extends StatelessWidget {
  TodosScreen({Key? key, required this.todos}) : super(key: key);

  final List<Todo> todos;

  final List<Leader> leaders = [
    Leader(
        "Cheikh Anta",
        "DOP",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "assets/anta.jpg"),
    Leader(
        "Thomas",
        "Sankara",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "assets/thomas.jpeg"),
    Leader(
        "Kwame",
        "Nkrumah",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "assets/knkrumah.jpg"),
    Leader(
        "Patrice Émery",
        "Lumumba",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "assets/patrice.jpeg"),
    Leader(
        "Wangari Maathai",
        "Maathai",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "assets/matti.jpg"),
    Leader(
        "Aliko",
        "Dangote",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "assets/aliko.jpg"),
    Leader(
        "Rose",
        "Dieng-Kuntz",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "assets/rose.jpeg"),
    Leader(
        "Mouammar",
        "Kadhafi",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "assets/kadhafi.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
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

class DetailScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const DetailScreen({Key? key, required this.leader}) : super(key: key);

  // Declare a field that holds the Todo.
  final Leader leader;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(leader.leaderFname),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(leader.leaderLname),
            Text(leader.leaderFname),
            Text(leader.leaderRole),
            Text(leader.leaderCountry),
          ],
        ),
      ),
    );
  }
}
