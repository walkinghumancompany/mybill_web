import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'calculator/classification_platform.dart';
import 'package:mybill_web/models/colors_model.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';
import 'web_top_appbar.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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

    // Device type 분류: 0 - 모바일, 1 - 태블릿, 2 - 웹
    int deviceType = _classificationPlatform.classifyWithScreenSize(
        context: context);

    final int screenType = _classificationPlatform.classifyWithDevice(context: context);

    final screenSize = MediaQuery.of(context).size;
    double screenHeight = MediaQuery.of(context).size.height;
    final double buttonWidth = MediaQuery.of(context).size.width * 0.5;
    final double buttonHeight = 50;
    final double tabletButtonWidth = MediaQuery.of(context).size.width * 0.3;
    final double tabletButtonHeight = 50;

    // Widget introTextWidget;
    // if(screenType == 0){
    //   introTextWidget = Positioned(
    //     left: 220,
    //     top: 100,
    //     height: screenHeight * 0.3,
    //     child: Image.asset('assets/introText_add.png', fit: BoxFit.contain,),
    //   );
    // }else{
    //   introTextWidget = Align(
    //     alignment: Alignment.center,
    //     child: Positioned(
    //       top: 100,
    //       child: Image.asset('assets/introText_add.png', fit: BoxFit.contain, height: screenHeight * 0.3),
    //     ),
    //   );
    // }

    Widget positionedWidget;
    if(screenType == 0){
      positionedWidget = Positioned(
          top: (screenSize.height - buttonHeight) / 1.7,
          left: (screenSize.width - buttonWidth) / 2,
          width: buttonWidth,
          height: buttonHeight,
          child: ElevatedButton(
            onPressed: () => launchPhone("1566-3988"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xff1F5372)),
              shape: MaterialStateProperty.all(StadiumBorder()),
              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 48, vertical: 15)),
            ),
            child: const Text(
              '견적문의전화',
              style: TextStyle(
                  fontFamily: 'AppleSDGothicNeo',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white
              ),
            ),
          )
      );
    }else if(screenType == 1){
      positionedWidget = Positioned(
          top: 650,
          left: (screenSize.width - tabletButtonWidth) / 2.5,
          width: 280,
          height: 58,
          child: ElevatedButton(
            onPressed: () => null,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xff1F5372)),
              shape: MaterialStateProperty.all(StadiumBorder()),
              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 48, vertical: 15)),
            ),
            child: const Text(
              '견적문의 : 1566-3988',
              style: TextStyle(
                  fontFamily: 'AppleSDGothicNeo',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white
              ),
            ),
          )
      );
    }else if(screenType == 2){
      positionedWidget = Positioned(
          top: 500,
          left: (screenSize.width - tabletButtonWidth) / 2.6,
          width: 280,
          height: 50,
          child: ElevatedButton(
            onPressed: () => null,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xff1F5372)),
              shape: MaterialStateProperty.all(StadiumBorder()),
              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 48, vertical: 15)),
            ),
            child: const Text(
              '견적문의 : 01057397300',
              style: TextStyle(
                  fontFamily: 'AppleSDGothicNeo',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white
              ),
            ),
          )
      );
    }else {
      positionedWidget = Container();
    }

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
        alignment: Alignment.center,
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
              padding: EdgeInsets.only(top: 30, left: 20),
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
                Positioned(
                  left: 220,
                  top: 100,
                  height: screenHeight * 0.3,
                  child: Image.asset('assets/introText_add.png', fit: BoxFit.contain,),
                ),
                // introTextWidget,
                Positioned(
                  height: screenHeight * 0.38,
                  top: 70,
                  left: 25,
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
                positionedWidget,
              ],
            ),
          ],
        ),
      ),
    );
  }
  void launchPhone(String phoneNumber) async {
    final String url = 'tel:$phoneNumber';
    if (kIsWeb) {
      // 웹 플랫폼일 경우 HTML <a> 태그를 사용
      // HTML을 직접 조작하는 대신 url_launcher 패키지 사용
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else {
      // 모바일 또는 데스크탑 플랫폼일 경우
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
