import 'package:flutter/material.dart';

class ProverbScreen extends StatelessWidget {
  const ProverbScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fullWidthScreen = MediaQuery.of(context).size.width;
    double fullHeightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          child: Text("screen proverbe"),
        ),
      );   
  }
}