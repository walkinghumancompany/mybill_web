import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybill_web/models/colors_model.dart';
import 'package:mybill_web/common_app_bar.dart';
import 'package:provider/provider.dart';
import 'calculator/classification_platform.dart';
import 'footer.dart';
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
  ChewieController? _chewieController;
  bool _isLoading = false;
  List<VideoPlayerController> _videoPlayerControllers = [];
  List<ChewieController?> _chewieControllers = [];

  List<String> video = [
    'assets/service-main.mp4',
    'assets/service-billing.mp4',
    'assets/service-meter.mp4',
    'assets/service-notification.mp4',
    'assets/service-manager.mp4',
  ];

  List<String> subject = [
    'assets/serviceText-main.png',
    'assets/serviceText-billing.png',
    'assets/serviceText-meter.png',
    'assets/serviceText-notification.png',
    'assets/serviceText-manager.png',
  ];


  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeAllVideos();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MainDesktopState>(context, listen: false).setActive(false);
      setState(() {});
    });
  }

  Future<void> _initializeAllVideos() async {
    setState(() {
      _isLoading = true;
    });

    for (String videoPath in video) {
      VideoPlayerController controller = VideoPlayerController.asset(videoPath);
      await controller.initialize();
      _videoPlayerControllers.add(controller);

      _chewieControllers.add(ChewieController(
        videoPlayerController: controller,
        autoPlay: true,
        looping: true,
        showControls: false,
        showOptions: false,
      ));
    }

    setState(() {
      _isLoading = false;
      _chewieController = _chewieControllers[currentIndex];
    });
  }

  Future<void> _videoNext() async {
    setState(() {
      _isLoading = true;
      currentIndex = (currentIndex + 1) % video.length;
    });
    await _changeVideo();
  }

  Future<void> _videoPrevious() async {
    setState(() {
      _isLoading = true;
      currentIndex = (currentIndex - 1 + video.length) % video.length;
    });
    await _changeVideo();
  }

  Future<void> _changeVideo() async {
    setState(() {
      _isLoading = true;
      _chewieController?.pause();
      _chewieController = _chewieControllers[currentIndex];
    });

    await _chewieController!.videoPlayerController.play();

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _initializeVideo() async {
    _videoPlayerController = VideoPlayerController.asset(video[currentIndex]);
    await _videoPlayerController.initialize();
    setState(() {
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: true,
        showControls: false,
        showOptions: false,
      );
    });
  }

  @override
  void dispose() {
    for (var controller in _videoPlayerControllers) {
      controller.dispose();
    }
    for (var controller in _chewieControllers) {
      controller?.dispose();
    }
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
                          if (deviceType == 0) FooterMobile(),
                          if (deviceType == 1) FooterTablet(),
                          if (deviceType == 2) FooterDesktop()
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
    return
      Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                height: 120,
                child: Image.asset(
                  subject[currentIndex],
                  fit: BoxFit.contain,),
              ),
              const SizedBox(
                height: 45,
              ),
              Container(
                alignment: Alignment.topCenter,
                height: 380,
                child: _chewieControllers.isNotEmpty && !_isLoading
                    ? Chewie(controller: _chewieControllers[currentIndex]!)
                    : Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(_colorsModel.main),
                  ),
                ),
              ),
              const SizedBox(
                height: 65,
              )
            ],
          ),
          Positioned(
            right: 20,
            top: 380,
            child: GestureDetector(
              onTap: _videoNext,
              child: Image.asset('assets/btn_next.png',
                fit: BoxFit.contain,
                height: 40,),
            ),
          ),
          Positioned(
            left: 20,
            top: 380,
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
  Widget _buildTabletLayout() {
    return
      Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.center,
                height: 120,
                child: Image.asset(
                  subject[currentIndex],
                  fit: BoxFit.contain,),
              ),
              const SizedBox(
                height: 55,
              ),
              Container(
                alignment: Alignment.topCenter,
                height: 620,
                child: _chewieController != null
                    ? Chewie(controller: _chewieController!)
                    : CircularProgressIndicator(), // 또는 다른 로딩 인디케이터
              ),
              if (_isLoading)
                Container(
                  color: _colorsModel.main,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              const SizedBox(
                height: 125,
              )
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
              height: 150,
              child: Image.asset(
                subject[currentIndex],
                fit: BoxFit.contain,),
            ),
            const SizedBox(
              height: 55,
            ),
            Container(
              alignment: Alignment.topCenter,
              height: 620,
              child: _chewieController != null
                  ? Chewie(controller: _chewieController!)
                  : CircularProgressIndicator(), // 또는 다른 로딩 인디케이터
            ),
            if (_isLoading)
              Container(
                color: _colorsModel.main,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            const SizedBox(
              height: 125,
            )
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
