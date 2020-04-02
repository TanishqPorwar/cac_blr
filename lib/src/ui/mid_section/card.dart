import 'package:flutter/material.dart';
import '../../models/items.dart';

class MidCard extends StatelessWidget {
  final Items item;
  MidCard({@required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color:
            (item.color == Color(00)) ? ThemeData.dark().cardColor : item.color,
        elevation: (item.elevation == 0) ? 5.0 : item.elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // the icon
              item.icon,

              // gap
              SizedBox(
                height: 20,
              ),

              // the title
              Text(
                item.title,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
