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
            title: Text(leader.leaderFname + ' ' +leader.leaderLname),
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
                  // height: fullHeightScreen,
                  width: fullWidthScreen,
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text("Nom de famille :", style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),)
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(leader.leaderLname, style: TextStyle(fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500),)
                      ),
                      
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
