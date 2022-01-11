import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:andoo/models/LeaderType.dart';
//Import Screens
import 'package:andoo/screens/about.dart';
import 'package:andoo/screens/culture.dart';
import 'package:andoo/screens/auth/login.dart';
import 'package:andoo/screens/contes.dart';
import 'package:andoo/screens/details.dart';
import 'package:andoo/screens/discover.dart';
import 'package:andoo/screens/games.dart';
import 'package:andoo/screens/proverb.dart';
import 'package:andoo/screens/setting.dart';

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
              listTitleDrawer(Icons.gamepad_outlined, "Jeux", context, "gameScreen"),
              listTitleDrawer(Icons.group, "Contes", context, "conteScreen"),
              listTitleDrawer(Icons.reduce_capacity_rounded, "Proverbes", context, "proverbScreen"),
              listTitleDrawer(Icons.repeat_rounded, "Découvertes", context, "discoverScreen"),
              listTitleDrawer(Icons.language_rounded, "Ethnies & Langue", context, "cultureScreen"),

              SizedBox(height: 10,),

              listTitleDrawer(Icons.info_outline, "A propos", context, "aboutScreen"),
              listTitleDrawer(Icons.login_outlined, "connexion", context, "loginScreen"),
              listTitleDrawer(Icons.settings_applications_outlined, "Paramétre", context, "settingScreen"),

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


Widget listTitleDrawer(iconName, String textTitle ,context, screenName){
  
  dynamic buildPageContext;

  switch (screenName) {
    case 'gameScreen':
      buildPageContext = (context) => GameScreen();
      break;
    case 'conteScreen':
      buildPageContext = (context) => ConteScreen();
      break;
    case 'proverbScreen':
      buildPageContext = (context) => ProverbScreen();
      break;
    case 'discoverScreen':
      buildPageContext = (context) => DiscoverScreen();
      break;
    case 'cultureScreen':
      buildPageContext = (context) => CultureScreen();
      break;
    case 'aboutScreen':
      buildPageContext = (context) => AboutScreen();
      break;
    case 'loginScreen':
      buildPageContext = (context) => LoginScreen();
      break;
    case 'settingScreen':
      buildPageContext = (context) => SettingScreen();
      break;


    default:
  }

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
      onTap: () => Navigator.push(context, MaterialPageRoute(
        builder: buildPageContext
      )),
    );
}