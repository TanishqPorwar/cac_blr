import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Items {
  String title;
  var content;
  FaIcon icon;

  Items(String title, var content, FaIcon icon) {
    this.title = title;
    this.content = content;
    this.icon = icon;
  }
}

var mid = [
  Items("Do's & Don'ts", [], FaIcon(FontAwesomeIcons.clipboardCheck)),
  Items("Myth Busters", [], FaIcon(FontAwesomeIcons.skull)),
  Items("Live Count", [], FaIcon(FontAwesomeIcons.chartLine)),
  Items("Outbreak Near Me", [], FaIcon(FontAwesomeIcons.mapMarkerAlt)),
];
