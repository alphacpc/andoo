import 'package:andoo/screens/details.dart';
import 'package:andoo/models/LeaderType.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.leaders}) : super(key: key);

  final List<Leader> leaders;

  @override
  Widget build(BuildContext context) {
    double fullWidthScreen = MediaQuery.of(context).size.width;
    double fullheightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: Container(
        width: fullWidthScreen / 1.7,
        child: Drawer(
          child: ListView(
            // padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.deepOrange),
                  child: Center(
                    child: Text('andoo', style: 
                      TextStyle(
                        color: Colors.white,
                        fontSize: 44,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontFamily: 'MavenPro'
                      ),
                    ) ,
                  )),
              listTitleDrawer(Icons.gamepad_outlined, "Jeux", context),
              listTitleDrawer(Icons.group, "Contes", context),
              listTitleDrawer(Icons.reduce_capacity_rounded, "Proverbes", context),
              listTitleDrawer(Icons.repeat_rounded, "Découvertes", context),
              listTitleDrawer(Icons.language_rounded, "Ethnies & Langue", context),

              SizedBox(height: 10,),

              listTitleDrawer(Icons.info_outline, "A propos", context),
              listTitleDrawer(Icons.login_outlined, "connexion", context),
              listTitleDrawer(Icons.settings_applications_outlined, "Paramétre", context),

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
                            Colors.deepOrange.withOpacity(0.6),
                            BlendMode.dstATop),
                        image: new AssetImage("assets/images/africa1.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: Text(
                'Une génération de leaders africains',
                style: TextStyle(
                  fontFamily: 'Cabin',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    width: fullWidthScreen,
                    height: fullheightScreen + 80,
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
  print('I want to delete');
}


Widget listTitleDrawer(iconName, String textTitle ,context){
  return ListTile(
      title: Container(
          child: Row(
            children: [
              Icon(iconName, color: Colors.deepOrange,),
              SizedBox(width: 20,),
              Text(textTitle, style: 
                TextStyle(
                  fontSize: 14,
                  letterSpacing: 1,
                  fontFamily: 'Montserrat',
              ), )
            ],
          ),
      ),
      onTap: () => Navigator.pop(context),
    );
}