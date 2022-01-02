import 'package:andoo/models/LeaderType.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.leader}) : super(key: key);

  final Leader leader;

  @override
  Widget build(BuildContext context) {
    double fullWidthScreen = MediaQuery.of(context).size.width;
    double fullHeightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Details [ ' + leader.leaderFname + ' ]'),
        // ),
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: fullHeightScreen * 0.4,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text('Details [ ' + leader.leaderFname + ' ]'),
            background: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.dstATop),
                      image: new AssetImage(leader.leaderPicture),
                      fit: BoxFit.cover)),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
                child: Column(
              children: [
                Container(
                  height: fullHeightScreen,
                  width: fullWidthScreen,
                  child: Column(
                    children: [
                      Text(leader.leaderLname),
                      Text(leader.leaderFname),
                      Text(leader.leaderMessage),
                    ],
                  ),
                )
              ],
            )),
          ]),
        )
      ],
    ));

    // Padding(
    //   padding: const EdgeInsets.all(16.0),
    //   child: Column(
    //     children: [
    //       Text(leader.leaderLname),
    //       Text(leader.leaderFname),
    //       Text(leader.leaderMessage),
    //     ],
    //   ),
    // ),
  }
}
