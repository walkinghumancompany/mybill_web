import 'package:flutter/material.dart';

class CitizenImageSlider extends StatefulWidget {
  const CitizenImageSlider({Key? key}) : super(key: key);

  @override
  State<CitizenImageSlider> createState() => _CitizenImageSliderState();
}

class _CitizenImageSliderState extends State<CitizenImageSlider> {

  List<String> citizenImage = [
    'assets/main-citizen01.png',
    'assets/main-citizen02.png',
    'assets/main-citizen03.png',
    'assets/main-citizen04.png',
  ];

  int currentIndex = 0;

  void _nextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % citizenImage.length;
    });
  }

  void _previousImage() {
    setState(() {
      currentIndex = (currentIndex - 1 + citizenImage.length) % citizenImage.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Stack(
        alignment: Alignment.center,
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: Image.asset(
              citizenImage[currentIndex],
              key: ValueKey<int>(currentIndex),
              width: MediaQuery.of(context).size.width * 1,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            right: 150,
            bottom: 70,
            child: GestureDetector(
              onTap: _previousImage,
              child: Image.asset('assets/btn_before.png',
                fit: BoxFit.contain,
                height: 30,),
            ),
          ),
          Positioned(
            right: 100,
            bottom: 70,
            child: GestureDetector(
              onTap: _nextImage,
              child: Image.asset('assets/btn_next.png',
                fit: BoxFit.contain,
                height: 30,),
            ),
          ),
        ],
      );
  }
}
