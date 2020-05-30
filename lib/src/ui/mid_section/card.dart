import 'package:cac_blr/src/ui/common_ui/web_view_page.dart';
import 'package:flutter/material.dart';
import '../../models/items.dart';

class MidCard extends StatelessWidget {
  final Items item;
  MidCard({@required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: (item.color == Color(00))
            ? Theme.of(context).cardColor
            : item.color,
        elevation: (item.elevation == 0) ? 3.0 : item.elevation,
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
              ),
              SizedBox(height: 10),
              (item.color == Color(00)) ? Container() : Text("Open ➜"),
            ],
          ),
        ),
      ),
      onTap: () {
        if (item.webUrl != null) {
          print("check");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WebViewPage(item.webUrl)));
        }
      },
    );
  }
}
