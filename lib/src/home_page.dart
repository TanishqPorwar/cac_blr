import 'package:cac_blr/src/models/items.dart';
import 'package:cac_blr/src/ui/mid_section/card.dart';
import 'package:cac_blr/src/ui/top_section/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(top: 0, bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _topSection(),
                      _midListView(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topSection() {
    return Stack(
      children: <Widget>[
        BackdropImage(
            "https://image.freepik.com/free-vector/gradient-geometric-shapes-dark-wallpaper-theme_23-2148437737.jpg"),
        // Padding(
        //   padding: EdgeInsets.only(top: 0),
        //   child: Image.asset(
        //     "assets/images/avatar.png",
        //     width: MediaQuery.of(context).size.width,
        //     alignment: Alignment.centerLeft,
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Welcome!!",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FaIcon(
                    FontAwesomeIcons.mapMarkerAlt,
                    size: 16,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Bangalore",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _midListView() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25 + 8,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: mid.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(width: 150, child: MidCard(item: mid[index]));
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: 15),
      ),
    );
  }
}
