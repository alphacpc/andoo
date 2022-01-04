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
              width: fullWidthScreen,
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
              child: Column(
                children: [
                  showRowElement(Icons.person_outline_rounded, "Nom de famille", leader.leaderLname),
                  showRowElement(Icons.person_outline_rounded, "Prénom", leader.leaderFname),
                  showRowElement(Icons.date_range,"Date de Naissance", leader.leaderBornDate),
                  showRowElement(Icons.home_outlined,"Lieu de Naissance", leader.leaderBornFrom),
                  showRowElement(Icons.flag_outlined,"Nationalité", leader.leaderCountry),
                  showRowElementWithoutIcon( "Profession", leader.leaderRole),
                ],
            )),
          ]),
        )
      ],
    ));
  }
}


showRowElement(nameIcon, nameLabel, valueLeader) {
  return Row(
      children: [
        Container(
          child: Row(
            children: [
              Icon(nameIcon),
              Text("$nameLabel : ")
            ],
          ),
        ),
        Text(valueLeader)
      ],
  );
}


showRowElementWithoutIcon( nameLabel, valueLeader) {
  return Row(
      children: [
        Container(
          child: Row(
            children: [
              Text("$nameLabel : ")
            ],
          ),
        ),
        Text(valueLeader)
      ],
  );
}
