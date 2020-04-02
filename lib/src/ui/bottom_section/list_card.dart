import 'package:cac_blr/src/home_page.dart';
import 'package:cac_blr/src/models/items.dart';
import 'package:cac_blr/src/ui/bottom_section/relative_delegate.dart';
import 'package:flutter/material.dart';

class ListCard extends StatefulWidget {
  final Items item;
  ListCard({@required this.item});
  @override
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  final double imageHeight = 60;
  final double imageWidth = 60;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: SizedBox(
          // setting the size of the box
          height: imageHeight * 1.75,

          // positioning the thumbnail at the center left of the bottom
          // content
          child: CustomMultiChildLayout(
            delegate: RelativeDelegate(objectCenter: FractionalOffset(0, 0.5)),
            children: <Widget>[
              LayoutId(
                id: Slot.bottom,
                child: _bottomContent(),
              ),
              LayoutId(
                id: Slot.top,
                child: _topContent(),
              )
            ],
          ),
        ),

        // when the card is tapped, go to the [DetailPage]
        onTap: () => Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (_, __, ___) => HomePage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(opacity: animation, child: child),
              ),
            ));
  }

  Widget _bottomContent() => Card(
        elevation: 10.0,
        child: Padding(
          padding: EdgeInsets.only(left: imageWidth / 2 + 10, right: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // gap
                    SizedBox(
                      height: 24.0,
                    ),

                    // event title

                    Flexible(
                      child: Text(
                        widget.item.title,
                        style: TextStyle().copyWith(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    // gap
                    SizedBox(
                      height: 14.0,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  /// The top content. Contains the thumbnail image
  Widget _topContent() {
    Image image;
    image = Image.asset(
      widget.item.icon,
      width: imageHeight,
      height: imageWidth,
    );

    return image;
  }
}
