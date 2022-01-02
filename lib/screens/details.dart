import 'package:andoo/models/LeaderType.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  // In the constructor, require a Leader.
  const DetailScreen({Key? key, required this.leader}) : super(key: key);

  // Declare a field that holds the Leader.
  final Leader leader;

  @override
  Widget build(BuildContext context) {
    // Use the Leader to create the UI.
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
