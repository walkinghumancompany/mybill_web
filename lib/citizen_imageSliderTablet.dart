import 'package:flutter/material.dart';
import 'models/colors_model.dart';

class CitizenImageSliderTablet extends StatefulWidget {
  const CitizenImageSliderTablet({Key? key}) : super(key: key);

  @override
  State<CitizenImageSliderTablet> createState() => _CitizenImageSliderTabletState();
}

class _CitizenImageSliderTabletState extends State<CitizenImageSliderTablet> {
  bool _isLoading = false;
  ColorsModel _colorsModel = ColorsModel();

  List<String> citizenImage = [
    'assets/mainTablet-citizen01.png',
    'assets/mainTablet-citizen02.png',
    'assets/mainTablet-citizen03.png',
    'assets/mainTablet-citizen04.png',
  ];

  int currentIndex = 0;

  Future<void> _loadImage(int index) async {
    setState(() {
      _isLoading = true;
    });

    // 이미지 프리로딩
    await precacheImage(AssetImage(citizenImage[index]), context);

    setState(() {
      currentIndex = index;
      _isLoading = false;
    });
  }

  void _nextImage() {
    int nextIndex = (currentIndex + 1) % citizenImage.length;
    _loadImage(nextIndex);
  }

  void _previousImage() {
    int prevIndex = (currentIndex - 1 + citizenImage.length) % citizenImage.length;
    _loadImage(prevIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 100),
          child: _isLoading
              ? Container() // 로딩 중에는 빈 컨테이너 표시
              : Image.asset(
            citizenImage[currentIndex],
            key: ValueKey<int>(currentIndex),
            width: MediaQuery.of(context).size.width * 1,
            fit: BoxFit.contain,
          ),
        ),
        if (_isLoading)
          Container(
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(_colorsModel.main),
              ),
            ),
          ),
        Positioned(
          right: 110,
          bottom: 65,
          child: GestureDetector(
            onTap: _previousImage,
            child: Image.asset(
              'assets/btn_before.png',
              fit: BoxFit.contain,
              height: 30,
            ),
          ),
        ),
        Positioned(
          right: 60,
          bottom: 65,
          child: GestureDetector(
            onTap: _nextImage,
            child: Image.asset(
              'assets/btn_next.png',
              fit: BoxFit.contain,
              height: 30,
            ),
          ),
        ),
      ],
    );
  }
}