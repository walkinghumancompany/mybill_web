import 'package:flutter/material.dart';
import 'package:mybill_web/intro_company_page.dart';
import 'calculator/classification_platform.dart';
import 'package:mybill_web/models/colors_model.dart';
import 'web_top_appbar.dart';

class main_page extends StatefulWidget {
  const main_page({Key? key}) : super(key: key);

  @override
  State<main_page> createState() => _main_pageState();

}

class _main_pageState extends State<main_page> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3), // 애니메이션의 지속 시간을 2초로 설정
      vsync: this,
    )..repeat(reverse: true); // 애니메이션이 무한 반복되며, reverse: true로 설정하여 앞뒤로 재생

    // 투명도를 변경하는 Tween 애니메이션을 정의합니다.
    // Tween의 begin과 end 값을 조정하여 반짝임 효과의 강도를 조절할 수 있습니다.
    _animation = Tween<double>(begin: 0.0, end: 2.0).animate(_controller)
      ..addListener(() {
        setState(() {}); // 애니메이션이 변경될 때마다 위젯을 다시 빌드하도록 합니다.
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // 위젯이 dispose될 때 AnimationController를 정리합니다.
    super.dispose();
  }

  ClassificationPlatform _classificationPlatform = ClassificationPlatform();
  ColorsModel _colorsModel = ColorsModel();

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
              color: _colorsModel.selectedBoxColor,
              width: MediaQuery.of(context).size.width * widthMultiplier,
              height: screenHeight * 0.66,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * widthMultiplier,
                    height: screenHeight * 0.66,
                    child: Image.asset(
                      'assets/web_main.png', fit: BoxFit.cover,),
                  ),
                  Positioned(
                    left: (MediaQuery.of(context).size.width * widthMultiplier - 300) / 2 + (MediaQuery.of(context).size.width * widthMultiplier * 0.2),
                    top: 620 / 2 - 200 / 2 + (620 * 0.1),
                    child: Container(
                      width: 300,
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)), // 모서리를 둥글게 처리
                        image: DecorationImage(
                            image: AssetImage('assets/logo.png')
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20, // 오른쪽 가장자리에서 20픽셀 떨어진 위치
                    bottom: 20, // 하단 가장자리에서 20픽셀 떨어진 위치
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => intro_company())
                        );
                      },
                      backgroundColor: Colors.transparent, // 버튼 배경색을 투명으로 설정
                      elevation: 10.0, // 버튼 그림자 깊이를 설정하여 입체감 추가
                      child: FadeTransition(
                        opacity: _animation,
                        child: ClipOval(
                          child: Container(
                            color: Colors.white, // 배경색 설정
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'assets/company.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4 * widthMultiplier,
                  height: screenHeight * 0.17,
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     width: 1
                  //   )
                  // ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 35,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        child: Text('고객센터',
                          style: TextStyle(
                            fontFamily: 'AppleSDGothicNeo', // 폰트 패밀리 지정
                            fontWeight: FontWeight.w400, // 폰트 두께를 400으로 지정 (REGULAR)
                            fontSize: 16, // 폰트 크기를 16으로 설정
                          ),),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        child: Text('1566-3988',
                          style: TextStyle(
                            fontFamily: 'AppleSDGothicNeo', // 폰트 패밀리 지정
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6 * widthMultiplier,
                  height: screenHeight * 0.17,
                  padding: EdgeInsets.all(2.0),
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //         width: 1
                  //     )
                  // ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 4),
                        child: Text('상호 : 주식회사 마이빌',
                          style: TextStyle(
                              fontFamily: 'AppleSDGothicNeo', // 폰트 패밀리 지정
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: _colorsModel.g97,
                          ),),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 4),
                        child: Text('대표자 : 최훈',
                          style: TextStyle(
                              fontFamily: 'AppleSDGothicNeo', // 폰트 패밀리 지정
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: _colorsModel.g97
                          ),),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 4),
                        child: Text('사업자번호 : 199-88-02887',
                          style: TextStyle(
                              fontFamily: 'AppleSDGothicNeo', // 폰트 패밀리 지정
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: _colorsModel.g97
                          ),),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 4),
                        child: Text('주소 : 경상남도 하동군 금남면 큰삼내길2',
                          style: TextStyle(
                              fontFamily: 'AppleSDGothicNeo', // 폰트 패밀리 지정
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: _colorsModel.g97
                          ),),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

