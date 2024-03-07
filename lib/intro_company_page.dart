import 'package:flutter/material.dart';
import 'calculator/classification_platform.dart';
import 'package:mybill_web/models/colors_model.dart';
import 'package:video_player/video_player.dart';
import 'web_top_appbar.dart';

class intro_company extends StatefulWidget {
  const intro_company({Key? key}) : super(key: key);

  @override
  State<intro_company> createState() => _intro_companyState();

}

class _intro_companyState extends State<intro_company> {

  ClassificationPlatform _classificationPlatform = ClassificationPlatform();
  ColorsModel _colorsModel = ColorsModel();
  late VideoPlayerController? _introTextController;

  @override
  void initState() {
    super.initState();

    // 안전한 초기화
    _introTextController = VideoPlayerController.asset('assets/checker.mov')
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
        }
      })
      ..setLooping(true)
      ..play();
  }


  @override
  void dispose() {
    _introTextController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // Device type 분류: 0 - 모바일, 1 - 태블릿, 2 - 웹
    int deviceType = _classificationPlatform.classifyWithScreenSize(
        context: context);

    double widthMultiplier;
    switch (deviceType) {
      case 0: // 모바일
        widthMultiplier = 1.0; // 전체 너비
        break;
      case 1: // 태블릿
        widthMultiplier = 0.85; // 85% 너비
        break;
      case 2: // 웹
        widthMultiplier = 0.7; // 70% 너비
        break;
      default:
        widthMultiplier = 1.0; // 기본값으로 전체 너비
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _colorsModel.wh,
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Container(
              width: MediaQuery.of(context).size.width * widthMultiplier,
              height: screenHeight * 0.12,
              child: TopAppBar(widthMultiplier: widthMultiplier),
            ),
            Container(
              width: MediaQuery.of(context).size.width * widthMultiplier,
              height: screenHeight * 0.12,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10.0),
              color: _colorsModel.selectedBoxColor,
              child: Image.asset('assets/introText.png', fit: BoxFit.contain,),
            ),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * widthMultiplier,
                  height: screenHeight * 0.71, // 영상의 높이가 적절하지 않을 경우 조정 필요
                  color: _colorsModel.selectedBoxColor,
                ),
                Positioned(
                  left: 500,
                  top: 20,
                  child: Opacity(
                    opacity: 0.5, // 투명도를 50%로 설정
                    child: Image.asset('assets/web_main.png', fit: BoxFit.cover,),
                  ),
                ),
                // introText_sec.png 이미지 배치
                Positioned(
                  left: 20,
                  top: 20,
                  height: screenHeight * 0.4,
                  child: Image.asset('assets/introText_sec.png', fit: BoxFit.contain,),
                ),
                Positioned(
                  height: screenHeight * 0.5,
                  top: 120,
                  left: 30,
                  child: _introTextController?.value.isInitialized ?? false
                      ? AspectRatio(
                    aspectRatio: _introTextController!.value.aspectRatio,
                    child: VideoPlayer(_introTextController!),
                  )
                      : Container(
                    height: 250, // 로딩 중 표시될 컨테이너의 높이
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
