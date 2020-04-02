import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Items {
  String title;
  var content;
  FaIcon icon;
  Color color;
  double elevation;

  Items(String title, var content, FaIcon icon, Color color) {
    this.title = title;
    this.content = content;
    this.icon = icon;
    this.color = color;
    this.elevation = 0;
  }
  void setColor(Color color) {
    this.color = color;
  }
}

var mid = [
  Items("Do's & Don'ts", [], FaIcon(FontAwesomeIcons.clipboardCheck),
      Colors.deepPurpleAccent[700]),
  Items("Myth Busters", [], FaIcon(FontAwesomeIcons.skull), Color(00)),
  Items("Live Count", [], FaIcon(FontAwesomeIcons.chartLine), Color(00)),
  Items(
      "Outbreak Near Me", [], FaIcon(FontAwesomeIcons.mapMarkerAlt), Color(00)),
];

Map<int, List<Items>> bottom = {
  1: [
    Items("Am I infected?", [], FaIcon(FontAwesomeIcons.biohazard), Color(00)),
    Items("When and How to use a mask?", [],
        FaIcon(FontAwesomeIcons.headSideMask), Color(00)),
    Items("When to get Tested?", [], FaIcon(FontAwesomeIcons.hospital),
        Color(00)),
    Items("how can I go out in the safest way possible", [],
        FaIcon(FontAwesomeIcons.cartPlus), Color(00)),
    Items("What does flatten the curve mean?", [],
        FaIcon(FontAwesomeIcons.chartArea), Color(00))
  ],
  2: [
    Items("Wash your hands with soap and water reguarly", [],
        FaIcon(FontAwesomeIcons.handsWash), Color(00)),
    Items("Use hand sanitizer with atleast 60% alcohol", [],
        FaIcon(FontAwesomeIcons.pumpMedical), Color(00)),
  ]
};
