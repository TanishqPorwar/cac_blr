import 'package:cac_blr/src/models/items.dart';
import 'package:cac_blr/src/ui/bottom_section/list_card.dart';
import 'package:cac_blr/src/ui/mid_section/card.dart';
import 'package:cac_blr/src/ui/top_section/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _controller;
  ScrollController _mainController;
  int _selected = 1;
  _scrollListener() {
    setState(() {
      if (_controller.offset < 52) {
        mid[0].setColor(Colors.deepPurpleAccent[700]);
        mid[0].elevation = 15.0;
        mid[1].elevation = 0;
        mid[1].setColor(Color(00));
        mid[2].setColor(Color(00));
        mid[3].setColor(Color(00));
      }
      if (_controller.offset >= 52 && _controller.offset < 216) {
        mid[0].setColor(Color(00));
        mid[2].setColor(Color(00));
        mid[3].setColor(Color(00));
        mid[0].elevation = 0;
        mid[2].elevation = 0;
        mid[1].elevation = 15.0;
        mid[1].setColor(Colors.deepPurpleAccent[700]);
      }
      if (_controller.offset >= 216) {
        mid[0].setColor(Color(00));
        mid[1].setColor(Color(00));
        mid[3].setColor(Color(00));
        mid[1].elevation = 0;
        mid[3].elevation = 0;
        mid[2].elevation = 15.0;
        mid[2].setColor(Colors.deepPurpleAccent[700]);
      }
      if (_controller.offset > 380) {
        mid[0].setColor(Color(00));
        mid[1].setColor(Color(00));
        mid[2].setColor(Color(00));
        mid[2].elevation = 0;
        mid[3].elevation = 15.0;
        mid[3].setColor(Colors.deepPurpleAccent[700]);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _mainController = ScrollController();
    _controller.addListener(_scrollListener);
    _selected = 1;
    mid[2].setwebUrl("https://www.covid19india.org/");
    // mid[3].setwebUrl("https://kgis.ksrsac.in/covid/#");
    bottom[1][0].setwebUrl("https://covid.apollo247.com/");
    bottom[1][4].setwebUrl("https://www.trackcorona.live/isolation");
    bottom[1][5].setwebUrl("https://factcheck.ksp.gov.in/");
    bottom[4][0].setwebUrl("https://twitter.com/BlrCityPolice");
    bottom[4][1].setwebUrl("https://twitter.com/BBMPCOMM");
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

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
                  controller: _mainController,
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _topSection(),
                      _midListView(),
                      SizedBox(height: 0),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: _tabBar(),
                      ),
                      SizedBox(height: 10),
                      _bottomSection()
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
        BackdropImage("assets/images/banner.jpg"),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Welcome!",
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
        controller: _controller,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: mid.length + 1,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
              width: 150,
              child: (index <= 3) ? MidCard(item: mid[index]) : null);
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: 15),
      ),
    );
  }

  Widget _tabBar() {
    Widget _tabButton({int tab, String title}) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Center(
                child: Text(
                  title,
                ),
              ),
            ),
            onTap: () async {
              if (tab != _selected) {
                setState(() {
                  _selected = tab;
                });
                if (_mainController.hasClients) {
                  await _mainController.animateTo(
                    500.0,
                    curve: Curves.decelerate,
                    duration: const Duration(milliseconds: 2500),
                  );
                }
              }
            },
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: (_selected == tab) ? Colors.deepPurpleAccent[700] : Color(00),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
              child: Container(
                  height: 30, child: _tabButton(tab: 1, title: "FAQ"))),
          // SizedBox(width: 5),
          Expanded(
              child: Container(
                  height: 30, child: _tabButton(tab: 2, title: "Preventions"))),
          // SizedBox(width: 5),
          Expanded(
              child: Container(
                  height: 30, child: _tabButton(tab: 3, title: "Symptoms"))),
          // SizedBox(width: 5),
          Expanded(
              child: Container(
                  height: 30, child: _tabButton(tab: 4, title: "Updates"))),
        ],
      ),
    );
  }

  Widget _bottomSection() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SizedBox(
            height: 250 + MediaQuery.of(context).size.height * 0.25,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              physics: BouncingScrollPhysics(),
              // scrollDirection: Axis.horizontal,
              itemCount: bottom[_selected].length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 10),
                    child: ListCard(item: bottom[_selected][index]),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(width: 15),
            ),
          ),
        ),
        // Container(
        //   child: Row(
        //     mainAxisSize: MainAxisSize.max,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     // crossAxisAlignment: CrossAxisAlignment.end,
        //     children: <Widget>[
        //       SizedBox(
        //         height: 300 + MediaQuery.of(context).size.height * 0.25,
        //       ),
        //       Column(
        //         // mainAxisSize: MainAxisSize.max,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         // mainAxisAlignment: MainAxisAlignment.end,
        //         children: <Widget>[
        //           IconButton(
        //               icon: Icon(Icons.arrow_downward),
        //               // color: (),
        //               onPressed: () async {
        //                 if (_mainController.hasClients) {
        //                   await _mainController.animateTo(
        //                     500.0,
        //                     curve: Curves.decelerate,
        //                     duration: const Duration(milliseconds: 2500),
        //                   );
        //                 }
        //               })
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
