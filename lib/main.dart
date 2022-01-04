import 'package:andoo/models/LeaderType.dart';
import 'package:flutter/material.dart';
import 'package:andoo/screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Passing Data',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.deepOrange[400]),
      home: HomeScreen(
        leaders: [
          Leader( 
            "Cheikh Anta",
            "DIOP",
            "29 décembre 1923",
            "Thieytou",
            "historien, anthropologue, chimiste",
            "Sénégalais",
            "assets/images/anta.jpg",
            "Lorem ipsum inst ...",
            true
          ),


          Leader(
              "Thomas",
              "Sankara",
              "21 décembre 1949",
              "Yako, Haute-Volta",
              "homme d'État anti-impérialiste, révolutionnaire, socialiste, panafricaniste et tiers-mondiste",
              "Burkinabais",
              "assets/images/thomas.jpeg",
              "Lorem ipsum inst ...",
              true
              ),
              
          Leader(
              "Kwame",
              "Nkrumah",
              "21 septembre 1909",
              "Nkroful",
              "homme d'État indépendantiste et panafricaniste",
              "Ghana",
              "assets/images/knkrumah.jpg",
              "Lorem ipsum dolor elit...",
              true
              ),


          Leader(
              "Patrice Émery",
              "Lumumba",
              "2 juillet 1925",
              "Onalua, Kasaï-Oriental (Congo belge)",
              "premier Premier ministre de la République démocratique du Congo",
              "RDC",
              "assets/images/patrice.jpeg",
              "Lorem ipsum dolor elit...",
              true
              ),


          Leader(
              "Wangari Maathai",
              "Maathai",
              "1er avril 1940",
              "Ihithe (colonie du Kenya)",
              " biologiste, professeure d'anatomie en médecine vétérinaire et militante politique et écologiste",
              "Kenya",
              "assets/images/matti.jpg",
              "Lorem ipsum dolor elit...",
              true
              ),


          Leader(
              "Aliko",
              "Dangote",
              "10 avril 1957 ",
              "Kano, Nord du Nigeria",
              "Homme d'affaires nigérian",
              "Nigéria",
              "assets/images/aliko.jpg",
              "Lorem ipsum dolor elit...",
              false,
              ),


          Leader(
              "Rose",
              "Dieng-Kuntz",
              "27 mars 1956",
              "Dakar",
              "Spécialiste en intelligence artificielle",
              "Sénégalaise",
              "assets/images/rose.jpeg",
              "Lorem ipsum dolor elit...",
              true,
              ),



          Leader(
              "Mouammar",
              "Kadhafi",
              "vers 1942",
              "Qasr Abou Hadi (Libye italienne)",
              "Militaire et homme d'État libyen.",
              "Lybien",
              "assets/images/kadhafi.jpg",
              "Lorem ipsum dolor elit...",
              true
              ),
        ],
      ),
    ),
  );
}
