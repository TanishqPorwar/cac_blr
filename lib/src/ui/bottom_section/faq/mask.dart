import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

final Map<int, List<String>> imgMap = {
  1: [
    "assets/images/1a.png",
    "assets/images/1b.png",
    "assets/images/1c.png",
    "assets/images/1d.png",
  ],
  2: [
    "assets/images/2a.png",
    "assets/images/2b.png",
    "assets/images/2c.png",
    "assets/images/2d.png",
  ],
  3: ["assets/images/masks.png"]
};

List<Widget> imageSLiders(List<String> imgList) {
  return imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        item,
                        fit: BoxFit.cover,
                        height: 300,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Container(),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();
}

class MaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(top: 0, bottom: 20.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(height: 70),
                    Text(
                      "How to use a mask",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    _buildSlider(imageSLiders(imgMap[1]), 5),
                    SizedBox(height: 20),
                    Text(
                      "When to use a mask",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    _buildSlider(imageSLiders(imgMap[2]), 8),
                    SizedBox(height: 50),
                    SizedBox(
                      height: 520,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: PhotoView(
                          imageProvider: AssetImage(imgMap[3][0]),
                          minScale: PhotoViewComputedScale.contained * 0.8,
                          maxScale: 4.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildSlider(imageSliders, s) {
    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: Duration(seconds: s),
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          ),
        ],
      ),
    );
  }
}
