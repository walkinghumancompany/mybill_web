import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybill_web/page_scroll.dart';
import 'calculator/classification_platform.dart';
import 'package:mybill_web/models/colors_model.dart';
import 'package:mybill_web/common_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class main_page extends StatefulWidget {
  const main_page({Key? key}) : super(key: key);

  @override
  State<main_page> createState() => _main_pageState();

}

class _main_pageState extends State<main_page> with SingleTickerProviderStateMixin {


  ClassificationPlatform _classificationPlatform = ClassificationPlatform();
  ColorsModel _colorsModel = ColorsModel();
  final CarouselController _controller = CarouselController();
  int countPage = 1;

  @override
  Widget build(BuildContext context) {
    // Device type 분류: 0 - 모바일, 1 - 태블릿, 2 - 웹
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

    return Scaffold(
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
                    if (deviceType == 0) _buildMobileLayout(),
                    if (deviceType == 1) _buildTabletLayout(),
                    if (deviceType == 2) _buildDesktopLayout(),
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

    final List<String?> imgList = [
      'assets/1.png',
      'assets/2.png',
      'assets/3.png',
      'assets/4.png'
    ];
    double containerWidth = MediaQuery.of(context).size.width;
    return Column(
          children: [
            Container(
              height: 370,
              child:
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 330,
                        child: Opacity(
                          opacity: 0.2,
                          child: Image.asset('assets/main.png',
                            fit: BoxFit.cover,),
                        ),
                      ),
                      Positioned(
                          top: 60,
                          left: 20,
                          width: MediaQuery.of(context).size.width * 0.75,
                          child:Image.asset('assets/Text01.png',
                            fit: BoxFit.contain,)
                      ),
                      Positioned(
                        bottom: 0, // Position from the top
                        left: containerWidth / 2.05,
                        width: 20,
                        height: 50,
                        child: Image.asset(
                          'assets/downArrow.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //건물관리 사업자
            Container(
              margin: EdgeInsets.all(9),
              child: Image.asset('assets/Text02.png',
              width: MediaQuery.of(context).size.width * 0.9,
              fit: BoxFit.contain,),
            ),
            const SizedBox(
              height: 65,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Image.asset('assets/Text03.png',
                    fit: BoxFit.contain,),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.12,
                  child: Text('0${countPage} / 04',
                    style: const TextStyle(
                      fontFamily: 'AppleSDGothicNeo',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black,
                    ),),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.065,
                  child: IconButton(
                      onPressed: () {
                        _controller.previousPage();
                        setState(() {
                          countPage = countPage == 1 ? 4 : countPage - 1;
                        });
                      },
                      icon: Icon(Icons.arrow_back)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.065,
                  child: IconButton(
                      onPressed: (){
                        _controller.nextPage();
                        setState(() {
                          countPage = countPage == 4 ? 1 : countPage + 1;
                        });
                      },
                      icon: Icon(Icons.arrow_forward)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: EdgeInsets.all(10),
                    height: 225,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Image.asset(
                        'assets/Text04.png',
                        width: MediaQuery.of(context).size.width * 0.4,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 225,
                    child: picScroll_mobile(context, imgList),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            //소규모 입주민회
            Container(
              margin: EdgeInsets.all(9),
              child: Image.asset('assets/Text05.png',
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.contain,),
            ),
            const SizedBox(
              height: 65,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Image.asset('assets/Text06.png',
                    fit: BoxFit.contain,),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.12,
                  child: Text('0${countPage} / 04',
                    style: const TextStyle(
                      fontFamily: 'AppleSDGothicNeo',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black,
                    ),),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.065,
                  child: IconButton(
                      onPressed: () {
                        _controller.previousPage();
                        setState(() {
                          countPage = countPage == 1 ? 4 : countPage - 1;
                        });
                      },
                      icon: Icon(Icons.arrow_back)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.065,
                  child: IconButton(
                      onPressed: (){
                        _controller.nextPage();
                        setState(() {
                          countPage = countPage == 4 ? 1 : countPage + 1;
                        });
                      },
                      icon: Icon(Icons.arrow_forward)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: EdgeInsets.all(10),
                    height: 225,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Image.asset(
                        'assets/Text07.png',
                        width: MediaQuery.of(context).size.width * 0.4,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 225,
                    child: picScroll_mobile(context, imgList),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              height: 500,
            )
          ],
        );
  }

  Widget _buildTabletLayout() {
    final List<String?> imgList = [
      'assets/1.png',
      'assets/2.png',
      'assets/3.png',
      'assets/4.png'
    ];
    double containerWidth = MediaQuery.of(context).size.width;
    return Column(
        children: [
          Container(
            height: 420,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 380,
                  child: Opacity(
                    opacity: 0.2,
                    child: Image.asset('assets/main.png',
                      fit: BoxFit.cover,),
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 20,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Image.asset(
                    'assets/Text01.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: containerWidth / 2.55,
                  width: 20,
                  height: 70,
                  child: Image.asset(
                    'assets/downArrow.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.all(9),
            child: Image.asset(
              'assets/Text02.png',
              width: MediaQuery.of(context).size.width * 0.68,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 75,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Image.asset(
                  'assets/Text03.png',
                  fit: BoxFit.contain,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: const Text(
                      '01 / 04',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      icon: Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: picScroll(context, imgList)
          )
        ],
      );
  }

  Widget _buildDesktopLayout() {
    final List<String?> imgList = [
      'assets/1.png',
      'assets/2.png',
      'assets/3.png',
      'assets/4.png'
    ];
    return Column(
        children: [
          Container(
            height: 420,
            child:
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 380,
                      child: Opacity(
                        opacity: 0.2,
                        child: Image.asset(
                          'assets/main.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 20,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Image.asset(
                        'assets/Text01.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      bottom: 10, // Position from the bottom
                      left: MediaQuery.of(context).size.width / 4.08,
                      width: 20,
                      height: 70,
                      child: Image.asset(
                        'assets/downArrow.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.all(9),
            child: Image.asset(
              'assets/Text02.png',
              width: MediaQuery.of(context).size.width * 0.3,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 75,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.12,
                child: Image.asset(
                  'assets/Text03.png',
                  fit: BoxFit.contain,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width * 0.17,
                    child: const Text(
                      '01 / 04',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.025,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.025,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      icon: Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: picScroll(context, imgList)
          )
        ],
    );
  }

  picScroll_mobile(BuildContext context, List<String?> imgList) {
    return CarouselSlider.builder(
        carouselController: _controller,
        itemCount: imgList.length,
        itemBuilder: (context, int itemIndex, int pageViewIndex) {
          return Container(
            child: Image.asset(imgList[itemIndex]!,
              fit: BoxFit.contain,),
          );
        },
        options: CarouselOptions(
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          initialPage: 1,
          viewportFraction: 1,
          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          autoPlay: false,
          onPageChanged: (index, reason) {
            setState(() {
              countPage = index + 1;
            });
          },
        ));
  }

  picScroll(BuildContext context, List<String?> imgList) {
    return CarouselSlider.builder(
        itemCount: imgList.length,
        itemBuilder: (context, int itemIndex, int pageViewIndex) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey, // 회색 보더라인 색상
                width: 0.5, // 보더라인 두께
              ),
            ),
            child: Image.asset(imgList[itemIndex]!,
            width: 250,
            height: 250,
            fit: BoxFit.contain,),
          );
        },
        options: CarouselOptions(
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        initialPage: 1,
        viewportFraction: 0.4,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        autoPlay: false,
    ));
  }

  buildCard(String? imgList) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          Image.asset('assets/X.png',
          width: 150,)
        ],
      ),
    );
  }
}

