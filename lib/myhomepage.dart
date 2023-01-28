import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current = 0;
  final List<String> images = [
    'assets/images/asia.jpg',
    'assets/images/africa.jpg',
    'assets/images/europe.jpg',
    'assets/images/south_america.jpg',
    'assets/images/australia.jpg',
    'assets/images/antarctica.jpg',
  ];

  final List<String> places = [
    'ASIA',
    'AFRICA',
    'EUROP',
    'SOUTH AMERICA',
    'AUSTRALIA',
    'ANTARTICA'
  ];

  List<Widget> generateImageiles() {
    return images
        .map((el) => ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              el,
              fit: BoxFit.cover,
              // height: 250,
              // width: 250,
              // height: 200,
            )))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // height: 500,
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          CarouselSlider(
              items: generateImageiles(),
              options: CarouselOptions(
                  onPageChanged: (index, reason) => {
                        setState(
                          () => {_current = index},
                        )
                      },
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 12 / 4)),
          AspectRatio(
            aspectRatio: 12 / 4,
            child: Center(
              child: Text(
                places[_current],
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 25),
              ),
            ),
          )
        ],
      ),
    );
  }
}
