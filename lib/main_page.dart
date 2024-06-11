import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  final CarouselController _controller02 = CarouselController();
  int countPage = 1;
  int countPage02 = 1;
  int _currentIndex = 0;
  int _currentIndex02 = 0;

  final List<String?> imgList = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png'
  ];
  final List<String?> imgList02 = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png'
  ];

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
    double containerWidth = MediaQuery.of(context).size.width;
    return Column(
          children: [
            Container(
              height: 340,
              child:
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 310,
                        child: Opacity(
                          opacity: 0.3,
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
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Image.asset('assets/Text03.png',
                    fit: BoxFit.contain,),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width * 0.22,
                  child: Text('0${countPage} / 04',
                    style: const TextStyle(
                      fontFamily: 'AppleSDGothicNeo',
                      fontWeight: FontWeight.w500,
                      fontSize: 13.5,
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
                    padding: EdgeInsets.all(20),
                    height: 250,
                    child: Align(
                      alignment: Alignment.center,
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
                    height: 250,
                    child: picScroll_mobile(context, imgList),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            //소규모 입주민회
            Container(
              margin: EdgeInsets.all(9),
              child: Image.asset('assets/Text05.png',
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.contain,),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Image.asset('assets/Text06.png',
                    fit: BoxFit.contain,),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width * 0.22,
                  child: Text('0${countPage02} / 04',
                    style: const TextStyle(
                      fontFamily: 'AppleSDGothicNeo',
                      fontWeight: FontWeight.w500,
                      fontSize: 13.5,
                      color: Colors.black,
                    ),),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.065,
                  child: IconButton(
                      onPressed: () {
                        _controller02.previousPage();
                        setState(() {
                          countPage02 = countPage02 == 1 ? 4 : countPage02 - 1;
                        });
                      },
                      icon: Icon(Icons.arrow_back)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.065,
                  child: IconButton(
                      onPressed: (){
                        _controller02.nextPage();
                        setState(() {
                          countPage02 = countPage02 == 4 ? 1 : countPage02 + 1;
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
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 250,
                    padding: EdgeInsets.all(20),
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/Text07.png',
                        width: MediaQuery.of(context).size.width * 0.28,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 250,
                    padding: EdgeInsets.all(10),
                    child: picScroll_mobile02(context, imgList02),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
            ),
           Container(
             height: 170,
             color: Color(0xffF9F9F9),
             child: Row(
               children: [
                 Container(
                   width: MediaQuery.of(context).size.width * 0.68,
                   padding: EdgeInsets.only(left: 10),
                   child: Column(
                     children: [
                       const SizedBox(
                         height: 30,
                       ),
                       Container(
                         alignment: Alignment.centerLeft,
                         child: const Text(
                           'MYBILL',
                           style: TextStyle(
                             fontFamily: 'AppleSDGothicNeo',
                             fontWeight: FontWeight.w700,
                             fontSize: 18,
                             color: Colors.black,
                           ),
                         ),
                       ),
                       const SizedBox(
                         height: 10,
                       ),
                       Container(
                         alignment: Alignment.centerLeft,
                         child: const Text(
                           '상호명 : 주식회사 마이빌',
                           style: TextStyle(
                             fontFamily: 'AppleSDGothicNeo',
                             fontWeight: FontWeight.w500,
                             fontSize: 13.5,
                             color: Colors.black,
                           ),
                         ),
                       ),
                       const SizedBox(
                         height: 2.5,
                       ),
                       Container(
                         alignment: Alignment.centerLeft,
                         child: const Text(
                           '대표 : 최훈',
                           style: TextStyle(
                             fontFamily: 'AppleSDGothicNeo',
                             fontWeight: FontWeight.w500,
                             fontSize: 13.5,
                             color: Colors.black,
                           ),
                         ),
                       ),
                       const SizedBox(
                         height: 2.5,
                       ),
                       Container(
                         alignment: Alignment.centerLeft,
                         child: const Text(
                           '사업자등록번호 : 199-88-02887',
                           style: TextStyle(
                             fontFamily: 'AppleSDGothicNeo',
                             fontWeight: FontWeight.w500,
                             fontSize: 13.5,
                             color: Colors.black,
                           ),
                         ),
                       ),
                       const SizedBox(
                         height: 2.5,
                       ),
                       Container(
                         alignment: Alignment.centerLeft,
                         child: const Text(
                           '주소 : 경상남도 하동군 금남면 큰삼내길2',
                           style: TextStyle(
                             fontFamily: 'AppleSDGothicNeo',
                             fontWeight: FontWeight.w500,
                             fontSize: 13.5,
                             color: Colors.black,
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
                 Container(
                   width: MediaQuery.of(context).size.width * 0.32,
                   alignment: Alignment.center,
                   child: Column(
                     children: [
                       const SizedBox(
                         height: 42,
                       ),
                       Container(
                         alignment: Alignment.center,
                         padding: EdgeInsets.zero,
                         child: const Text('고객센터',
                           style: TextStyle(
                             fontFamily: 'AppleSDGothicNeo',
                             fontWeight: FontWeight.w500,
                             fontSize: 14,
                             color: Colors.black,
                           ),),
                       ),
                       const SizedBox(
                         height: 12,
                       ),
                       Container(
                         alignment: Alignment.center,
                         padding: EdgeInsets.zero,
                         child: const Text('1566-3988',
                           style: TextStyle(
                             fontFamily: 'AppleSDGothicNeo',
                             fontWeight: FontWeight.w600,
                             fontSize: 18,
                             color: Colors.black,
                           ),),
                       )
                     ],
                   ),
                 ),
               ],
             ),
            )
          ],
        );
  }

  Widget _buildTabletLayout() {
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
          //건물관리사업자
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.14,
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
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      '0${_currentIndex + 1} / 0${imgList.length}',
                      style: const TextStyle(
                        fontFamily: 'AppleSDGothicNeo',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          _currentIndex = (_currentIndex - 1 + imgList.length) % imgList.length;
                        });
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          _currentIndex = (_currentIndex + 1) % imgList.length;
                        });
                      },
                      icon: Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 21),
          buildImageCarousel_tablet(),
          const SizedBox(
              height: 55),
          //소규모 입주민회
          Container(
            margin: EdgeInsets.all(9),
            width: MediaQuery.of(context).size.width * 0.58,
            child: Image.asset('assets/Text05-Web.png',
              fit: BoxFit.contain,),
          ),
          const SizedBox(
            height: 75,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.15,
                child: Image.asset(
                  'assets/Text06.png',
                  fit: BoxFit.contain,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      '0${_currentIndex02 + 1} / 0${imgList02.length}',
                      style: const TextStyle(
                        fontFamily: 'AppleSDGothicNeo',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          _currentIndex02 = (_currentIndex02 - 1 + imgList02.length) % imgList02.length;
                        });
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          _currentIndex02 = (_currentIndex02 + 1) % imgList02.length;
                        });
                      },
                      icon: Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
              height: 21),
          buildImageCarousel_tablet02(),
          const SizedBox(
            height: 100,
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey,
          ),
          Container(
            height: 155,
            color: Color(0xffF9F9F9),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'MYBILL',
                          style: TextStyle(
                            fontFamily: 'AppleSDGothicNeo',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          '상호명 : 주식회사 마이빌',
                          style: TextStyle(
                            fontFamily: 'AppleSDGothicNeo',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.5,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2.5,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          '대표 : 최훈',
                          style: TextStyle(
                            fontFamily: 'AppleSDGothicNeo',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.5,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2.5,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          '사업자등록번호 : 199-88-02887',
                          style: TextStyle(
                            fontFamily: 'AppleSDGothicNeo',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.5,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2.5,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          '주소 : 경상남도 하동군 금남면 큰삼내길2',
                          style: TextStyle(
                            fontFamily: 'AppleSDGothicNeo',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.5,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                        child: const Text('고객센터',
                          style: TextStyle(
                            fontFamily: 'AppleSDGothicNeo',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black,
                          ),),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                        child: const Text('1566-3988',
                          style: TextStyle(
                            fontFamily: 'AppleSDGothicNeo',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black,
                          ),),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      );
  }
  Widget buildImageCarousel_tablet() {
    return Container(
        height: 450,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child:Stack(
            children: [
              Positioned(
                top: 10,
                width: MediaQuery.of(context).size.width * 0.32,
                child: Image.asset('assets/Text04-Web.png',
                  fit: BoxFit.contain,),
              ),
              Positioned(
                bottom: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    buildImageContainer_tablet(0),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    buildImageContainer_tablet(1),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    buildImageContainer_tablet(2),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
  Widget buildImageContainer_tablet(int index) {
    int imgIndex = (_currentIndex + index) % imgList.length;
    double? width = (index ==2) ? MediaQuery.of(context).size.width * 0.5 : MediaQuery.of(context).size.width * 0.2;
    double? height = (index == 2) ? null : width;

    return Container(
      // duration: Duration(milliseconds: 600),
      // curve: Curves.easeInOut,
      width: width,
      height: height,
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        imgList[imgIndex]!,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildImageCarousel_tablet02() {
    return Container(
        height: 450,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child:Stack(
            children: [
              Positioned(
                top: 10,
                width: MediaQuery.of(context).size.width * 0.21,
                child: Image.asset('assets/Text07.png',
                  fit: BoxFit.contain,),
              ),
              Positioned(
                bottom: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    buildImageContainer_tablet02(0),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    buildImageContainer_tablet02(1),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    buildImageContainer_tablet02(2),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
  Widget buildImageContainer_tablet02(int index) {
    int imgIndex = (_currentIndex02 + index) % imgList02.length;
    double? width = (index ==2) ? MediaQuery.of(context).size.width * 0.5 : MediaQuery.of(context).size.width * 0.2;
    double? height = (index == 2) ? null : width;

    return Container(
      // duration: Duration(milliseconds: 600),
      // curve: Curves.easeInOut,
      width: width,
      height: height,
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        imgList02[imgIndex]!,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildDesktopLayout() {
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
                    child: Text(
                      '0${_currentIndex + 1} / 0${imgList.length}',
                      style: const TextStyle(
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
                        setState(() {
                          _currentIndex = (_currentIndex - 1 + imgList.length) % imgList.length;
                        });
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.025,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          _currentIndex = (_currentIndex + 1) % imgList.length;
                        });
                      },
                      icon: Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 9),
          buildImageCarousel(),
          const SizedBox(
              height: 55),
          //소규모 입주민회
          Container(
            margin: EdgeInsets.all(9),
            width: MediaQuery.of(context).size.width * 0.3,
            child: Image.asset('assets/Text05-Web.png',
              fit: BoxFit.contain,),
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
                  'assets/Text06.png',
                  fit: BoxFit.contain,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width * 0.17,
                    child: Text(
                      '0${_currentIndex02 + 1} / 0${imgList02.length}',
                      style: const TextStyle(
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
                        setState(() {
                          _currentIndex02 = (_currentIndex02 - 1 + imgList02.length) % imgList02.length;
                        });
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.025,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          _currentIndex02 = (_currentIndex02 + 1) % imgList02.length;
                        });
                      },
                      icon: Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
              height: 21),
          buildImageCarousel02(),
          const SizedBox(
            height: 100,
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey,
          ),
          Container(
            height: 155,
            color: Color(0xffF9F9F9),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'MYBILL',
                          style: TextStyle(
                            fontFamily: 'AppleSDGothicNeo',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          '상호명 : 주식회사 마이빌',
                          style: TextStyle(
                            fontFamily: 'AppleSDGothicNeo',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.5,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2.5,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          '대표 : 최훈',
                          style: TextStyle(
                            fontFamily: 'AppleSDGothicNeo',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.5,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2.5,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          '사업자등록번호 : 199-88-02887',
                          style: TextStyle(
                            fontFamily: 'AppleSDGothicNeo',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.5,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2.5,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          '주소 : 경상남도 하동군 금남면 큰삼내길2',
                          style: TextStyle(
                            fontFamily: 'AppleSDGothicNeo',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.5,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                        child: const Text('고객센터',
                          style: TextStyle(
                            fontFamily: 'AppleSDGothicNeo',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black,
                          ),),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                        child: const Text('1566-3988',
                          style: TextStyle(
                            fontFamily: 'AppleSDGothicNeo',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black,
                          ),),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
    );

  }
  Widget buildImageCarousel() {
    return Container(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child:Stack(
          children: [
            Positioned(
              top: 45,
              width: MediaQuery.of(context).size.width * 0.2,
              child: Image.asset('assets/Text04-Web.png',
                fit: BoxFit.contain,),
            ),
            Positioned(
              bottom: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  buildImageContainer(0),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  buildImageContainer(1),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  buildImageContainer(2),
                ],
              ),
            )
          ],
        ),
      )
    );
  }


  Widget buildImageContainer(int index) {
    int imgIndex = (_currentIndex + index) % imgList.length;
    double? width = (index ==2) ? null : MediaQuery.of(context).size.width * 0.13;
    double? height = (index == 2) ? 350 : width; // 큰 이미지 조건 설정

    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      width: width,
      height: height,
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        imgList[imgIndex]!,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget buildImageCarousel02() {
    return Container(
        height: 500,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child:Stack(
            children: [
              Positioned(
                top: 70,
                width: MediaQuery.of(context).size.width * 0.12,
                child: Image.asset('assets/Text07.png',
                  fit: BoxFit.contain,),
              ),
              Positioned(
                bottom: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    buildImageContainer02(0),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    buildImageContainer02(1),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    buildImageContainer02(2),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }


  Widget buildImageContainer02(int index) {
    int imgIndex = (_currentIndex02 + index) % imgList02.length;
    double? width = (index ==2) ? null : MediaQuery.of(context).size.width * 0.13;
    double? height = (index == 2) ? 350 : width; // 큰 이미지 조건 설정

    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      width: width,
      height: height,
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        imgList02[imgIndex]!,
        fit: BoxFit.contain,
      ),
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

  picScroll_mobile02(BuildContext context, List<String?> imgList02) {
    return CarouselSlider.builder(
        carouselController: _controller02,
        itemCount: imgList02.length,
        itemBuilder: (context, int itemIndex, int pageViewIndex) {
          return Container(
            child: Image.asset(imgList02[itemIndex]!,
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
              countPage02 = index + 1;
            });
          },
        ));
  }

}

