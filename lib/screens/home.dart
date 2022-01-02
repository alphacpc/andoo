import 'package:andoo/screens/details.dart';
import 'package:andoo/models/LeaderType.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.leaders}) : super(key: key);

  final List<Leader> leaders;

  @override
  Widget build(BuildContext context) {
    double fullWidthScreen = MediaQuery.of(context).size.width;
    double fullheightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: Container(
        width: fullWidthScreen / 2,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.deepOrange),
                  child: Text('Bienvenue sur andoo')),
              ListTile(
                title: const Text('Proverbe'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: const Text('Pays'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: const Text('Parametres'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: fullheightScreen * 0.4,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text('andoo'),
              background: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter: new ColorFilter.mode(
                            Colors.deepOrange.withOpacity(0.5),
                            BlendMode.dstATop),
                        image: new AssetImage("assets/africa1.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: Text(
                'Une generation de leaders africains',
                style: TextStyle(
                  fontFamily: 'Cabin',
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    width: fullWidthScreen,
                    height: fullheightScreen,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: leaders.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          key: ValueKey(4),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            leading: CircleAvatar(
                              radius: 28,
                              backgroundImage:
                                  new AssetImage(leaders[index].leaderPicture),
                            ),
                            title: Container(
                              // padding: EdgeInsets.fromLTRB(0, 0, 20, 30),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          leaders[index].leaderFname +
                                              ' ' +
                                              leaders[index].leaderLname,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(leaders[index].leaderMessage),
                                      ],
                                    ),
                                  ),
                                  // Icon(Icons.favorite_outline_outlined),
                                  Expanded(
                                    flex: 1,
                                    child:
                                        Icon(Icons.favorite_outline_outlined),
                                  )
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                            ),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailScreen(leader: leaders[index]))),
                          ),
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            dismissible: DismissiblePane(onDismissed: () {}),
                            children: const [
                              SlidableAction(
                                onPressed: doNothing,
                                backgroundColor: Color(0xFFD50000),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}

void doNothing(BuildContext context) {
  print('Hello word');
}
