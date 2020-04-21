import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Items {
  String title;
  var content;
  dynamic icon;
  Color color;
  double elevation;
  String webUrl;
  Items(String title, var content, dynamic icon, Color color) {
    this.title = title;
    this.content = content;
    this.icon = icon;
    this.color = color;
    this.elevation = 0;
    this.webUrl = null;
  }

  void setwebUrl(String u) {
    this.webUrl = u;
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
    Items("Am I infected?", [], "assets/images/biohazard.png", Color(00)),
    Items("When and How to use a mask?", [], "assets/images/virus.png",
        Color(00)),
    Items("When to get Tested?", [], "assets/images/hospital.png", Color(00)),
    Items("how can I go out in the safest way possible", [],
        "assets/images/pedal-board.png", Color(00)),
    Items("What does flatten the curve mean?", [],
        "assets/images/area-chart.png", Color(00)),
    Items(
        "Verify suspicious news", [], "assets/images/fake-news.png", Color(00))
  ],
  2: [
    Items("Wash your hands with soap and water reguarly", [],
        "assets/images/coronavirus.png", Color(00)),
    Items("Use hand sanitizer with at least 60% alcohol", [],
        "assets/images/hand-sanitizer.png", Color(00)),
    Items("Wash hands before touching eyes, nose and mouth", [],
        "assets/images/clean.png", Color(00)),
    Items("Throw used tissues into closed bins immediately after use", [],
        "assets/images/rubbish.png", Color(00)),
    Items("Cover your nose and mouth while sneezing", [],
        "assets/images/cough.png", Color(00)),
    Items("Avoid mass gathering and crowed places", [],
        "assets/images/virus.png", Color(00)),
  ],
  3: [
    Items("Dry Cough", [], "assets/images/dry-cough.png", Color(00)),
    Items("High Fever", [], "assets/images/fever.png", Color(00)),
    Items("Sore Throat", [], "assets/images/sore-throat.png", Color(00)),
    Items("Difficulty in Breathing", [], "assets/images/lungs.png", Color(00)),
  ],
  4: [
    Items("Bangalore City Police", [], "assets/images/police-station.png",
        Color(00)),
    Items(
        "B H Anil Kumar - BBMP", [], "assets/images/parliament.png", Color(00)),
  ],
};
