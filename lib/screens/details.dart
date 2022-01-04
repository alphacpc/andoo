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
                          Colors.deepOrange, BlendMode.dstATop),
                      image: new AssetImage(leader.leaderPicture),
                      fit: BoxFit.cover)),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              width: fullWidthScreen,
              // height: fullHeightScreen,
              padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
              child: Column(
                children: [
                  showRowElement(Icons.supervised_user_circle_outlined, "Nom de famille", leader.leaderLname),
                  showRowElement(Icons.person_outline_rounded, "Prénom", leader.leaderFname),
                  showRowElement(Icons.date_range,"Date de Naissance", leader.leaderBornDate),
                  showRowElement(Icons.home_outlined,"Lieu de Naissance", leader.leaderBornFrom),
                  showRowElement(Icons.flag_outlined,"Nationalité", leader.leaderCountry),
                  showRowElement(Icons.business_center_outlined,"Profession", leader.leaderRole),
                  showRowElementWithoutIcon("Biographie", leader.leaderBio),
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
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Container(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Icon(nameIcon,color: Colors.deepOrange, size: 20,),
              SizedBox(width: 10,),
              Text("$nameLabel ", style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 14
              ),)
            ],
          ),
        ),
        flex: 1),
        Expanded(child: Text(valueLeader, 
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: .2 
          )), flex: 1)
      ],
  );
}


showRowElementWithoutIcon(nameLabel, valueLeader) {
  return Container(
    padding: EdgeInsets.only(top: 30),
    child: Column(
      children: [
        Text("$nameLabel",
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          )
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Text(valueLeader,
            style: TextStyle(
              fontFamily: 'MavenPro',
              fontSize: 18,
              
            ),
          ),
        )
      ],
  )
  );
}
