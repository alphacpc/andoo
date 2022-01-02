import 'package:andoo/models/LeaderType.dart';
import 'package:flutter/material.dart';
import 'package:andoo/screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Passing Data',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.deepOrange),
      home: HomeScreen(
        leaders: [
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
        ],
      ),
    ),
  );
}
