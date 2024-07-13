import 'package:flutter/material.dart';


class BusinessImageSlider extends StatefulWidget {
  @override
  _BusinessImageSliderState createState() => _BusinessImageSliderState();
}

class _BusinessImageSliderState extends State<BusinessImageSlider> {
  List<String> businessImages = [
    'assets/main-business01.png',
    'assets/main-business02.png',
    'assets/main-business03.png',
    'assets/main-business04.png',
  ];

  int currentIndex = 0;

  void _nextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % businessImages.length;
    });
  }

  void _previousImage() {
    setState(() {
      currentIndex = (currentIndex - 1 + businessImages.length) % businessImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: Image.asset(
            businessImages[currentIndex],
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