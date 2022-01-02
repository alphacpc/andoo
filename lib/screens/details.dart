import 'package:andoo/models/LeaderType.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.leader}) : super(key: key);

  final Leader leader;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details [ ' + leader.leaderFname + ' ]'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(leader.leaderLname),
            Text(leader.leaderFname),
            Text(leader.leaderMessage),
          ],
        ),
      ),
    );
  }
}
