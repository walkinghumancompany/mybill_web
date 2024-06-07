import 'package:flutter/material.dart';

class BuildingAdd extends StatelessWidget {

  final GlobalKey key;
  BuildingAdd({required this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenCap = MediaQuery.of(context).size.width * 0.2;
    double screenArrow = MediaQuery.of(context).size.width * 0.05;

    return Column(
      children: [
        Row(
          children: [
            //첫번째 캡쳐
            Container(
              width: screenCap,
              padding: EdgeInsets.all(25),
              child: Image.asset('assets/05.png', fit: BoxFit.contain,),
            ),

            //화살표
            Container(
              width: screenArrow,
              padding: EdgeInsets.all(25),
              child: Image.asset('assets/arrow.png', fit: BoxFit.contain,),
            ),

            //두번째 캡쳐
            Container(
              width: screenCap,
              padding: EdgeInsets.all(25),
              child: Image.asset('assets/02.png', fit: BoxFit.contain,),
            ),

            //화살표
            Container(
              width: screenArrow,
              padding: EdgeInsets.all(25),
              child: Image.asset('assets/arrow.png', fit: BoxFit.contain,),
            ),

            //세번째 캡쳐
            Container(
              width: screenCap,
              padding: EdgeInsets.all(25),
              child: Image.asset('assets/03.png', fit: BoxFit.contain,),
            ),

            //화살표
            Container(
              width: screenArrow,
              padding: EdgeInsets.all(25),
              child: Image.asset('assets/arrow.png', fit: BoxFit.contain,),
            ),

            //네번째 캡쳐
            Container(
              width: screenCap,
              padding: EdgeInsets.all(25),
              child: Image.asset('assets/01.png', fit: BoxFit.contain,),
            ),
          ],
        ),
        Row(
          children: [
            //첫번째 텍스트
            Container(
                width: screenCap,
                padding: EdgeInsets.all(25),
                child: const Text('📌건물관리 클릭이후 +버튼을 클릭하여 건물등록을 활성화 합니다.')
            ),

            //화살표
            Container(
                width: screenArrow,
                padding: EdgeInsets.all(25),
                child: null
            ),

            //두번째 텍스트
            Container(
                width: screenCap,
                padding: EdgeInsets.all(25),
                child: const Text('📌계약된 입주민회의 건물이 하나일때와\n두개 이상일때를 구분하여\n선택합니다.')
            ),

            //화살표
            Container(
                width: screenArrow,
                padding: EdgeInsets.all(25),
                child: null
            ),

            //세번째 텍스트
            Container(
                width: screenCap,
                padding: EdgeInsets.all(25),
                child: const Text('📌각 건물의 층수와 세대수를 활성화 시킵니다.\n층별 또는 세대별로 호수나 층수를 따로 지정할 수 있습니다. 예를들어 4층이 없고 "F"층인경우, 3층 다음 5층인 경우등등')
            ),

            //화살표
            Container(
                width: screenArrow,
                padding: EdgeInsets.all(25),
                child: null
            ),

            //네번째 텍스트
            Container(
                width: screenCap,
                padding: EdgeInsets.all(25),
                child: const Text('📌건물의 해당 검침입력 사항과 고지서목록등을 선택합니다.')
            ),
          ],
        )
      ],
    );
  }
}
