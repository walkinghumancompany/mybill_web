import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybill_web/models/colors_model.dart';
import 'package:mybill_web/common_app_bar.dart';
import 'package:provider/provider.dart';
import 'calculator/classification_platform.dart';
import 'main.dart';
import 'package:video_player/video_player.dart';


class ServiceIntroduce extends StatefulWidget {
  const ServiceIntroduce({Key? key}) : super(key: key);

  @override
  State<ServiceIntroduce> createState() => _ServiceIntroduceState();
}

class _ServiceIntroduceState extends State<ServiceIntroduce> {

  ClassificationPlatform _classificationPlatform = ClassificationPlatform();
  ColorsModel _colorsModel = ColorsModel();
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  List<String> video = [
    'assets/service-main.mp4',
    'assets/service-billing.mp4',
    'assets/service-meter.mp4',
    'assets/service-notification.mp4',
    'assets/service-manager.mp4',
  ];

  int currentIndex = 0;

  void _videoNext() {
    setState(() {
      currentIndex = (currentIndex + 1) % video.length;
      _videoPlayerController.dispose();
      _chewieController.dispose();
      _initializeVideo();
    });
  }
  void _videoPrevious() {
    setState(() {
      currentIndex = (currentIndex - 1 + video.length) % video.length;
      _videoPlayerController.dispose();
      _chewieController.dispose();
      _initializeVideo();
    });
  }
  @override
  void initState() {
    super.initState();
    _initializeVideo();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MainDesktopState>(context, listen: false).setActive(false);
    });
  }

  void _initializeVideo() {
    _videoPlayerController = VideoPlayerController.asset(video[currentIndex]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      showControls: false,  // 컨트롤을 숨깁니다
      showOptions: false,   // 옵션 버튼을 숨깁니다
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int deviceType = _classificationPlatform.classifyWithDevice(
        context: context);

    double widthMultiplier;
    switch (deviceType) {
      case 0: // 모바일
        widthMultiplier = 1.0; // 전체 너비
        break;
      case 1: // 태블릿
        widthMultiplier = 0.8; // 85% 너비
        break;
      case 2: // 웹
        widthMultiplier = 0.5; // 70% 너비
        break;
      default:
        widthMultiplier = 1.0; // 기본값으로 전체 너비
    }
    return
      Scaffold(
          appBar: CommonAppBar(
            title: '',
            deviceType: deviceType,
            widthMultiplier: widthMultiplier,
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: _colorsModel.wh,
          body:
          SingleChildScrollView(
            child: Column(
                children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * widthMultiplier,
                      color: _colorsModel.wh,
                      child: Column(
                        children: [
                          // 여기에 각 디바이스 타입에 따른 레이아웃 구성 요소를 추가합니다.
                          if (deviceType == 0)  _buildMobileLayout(),
                          if (deviceType == 1)  _buildTabletLayout(),
                          if (deviceType == 2)  _buildDesktopLayout(),
                        ],
                      ),
                    ),
                  )
                ]
            ),
          )
      );
  }
  Widget _buildMobileLayout() {
    return Container();
}
  Widget _buildTabletLayout() {
    return Container();
  }
  Widget _buildDesktopLayout() {
    return
    Stack(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            Container(
              alignment: Alignment.center,
              height: 30,
              child: Image.asset('assets/introduce-main.png',
                fit: BoxFit.contain,),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                '기존의 복잡한 건물관리 프로세스를 간단하고 쉽게 업데이트 했습니다.\n실시간 납부관리, 간편한 검침기능, 자동관리비 계산등 편리하고 필수적인 기능들을 갖추고 있습니다.',
                style: TextStyle(
                  fontFamily: 'AppleSDGothicNeo',
                  fontWeight: FontWeight.w500,
                  fontSize: 12.7,
                  color: _colorsModel.gr1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 75,
            ),
            Container(
              alignment: Alignment.center,
              height: 620,
              child: Chewie(
                controller: _chewieController,
              ),
            ),
          ],
        ),
        Positioned(
          right: 10,
          top: 420,
          child: GestureDetector(
            onTap: _videoNext,
            child: Image.asset('assets/btn_next.png',
              fit: BoxFit.contain,
              height: 40,),
          ),
        ),
        Positioned(
          left: 10,
          top: 420,
          child: GestureDetector(
            onTap: _videoPrevious,
            child: Image.asset('assets/btn_before.png',
              fit: BoxFit.contain,
              height: 40,),
          ),
        )
      ],
    );
  }
}
