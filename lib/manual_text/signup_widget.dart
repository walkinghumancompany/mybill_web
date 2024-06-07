import 'package:flutter/material.dart';

class SignupWidget extends StatelessWidget {
  final GlobalKey key;
  SignupWidget({required this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenCap = MediaQuery.of(context).size.width * 0.2;
    double screenArrow = MediaQuery.of(context).size.width * 0.05;
    // 위젯 구현
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Row(
         children: [
           //첫번째 캡쳐
           Container(
             width: screenCap,
             padding: EdgeInsets.only(top: 10, left: 10, right: 10),
             margin: EdgeInsets.zero,
             child: Image.asset('assets/01.png', fit: BoxFit.contain,),
           ),

           //화살표
           Container(
             width: screenArrow,
             padding: EdgeInsets.all(0),
             child: Image.asset('assets/arrow.png', fit: BoxFit.contain,),
           ),

           //두번째 캡쳐
           Container(
             width: screenCap,
             padding: EdgeInsets.all(0),
             child: Image.asset('assets/02.png', fit: BoxFit.contain,),
           ),

           //화살표
           Container(
             width: screenArrow,
             padding: EdgeInsets.all(0),
             child: Image.asset('assets/arrow.png', fit: BoxFit.contain,),
           ),

           //세번째 캡쳐
           Container(
             width: screenCap,
             padding: EdgeInsets.all(0),
             child: Image.asset('assets/03.png', fit: BoxFit.contain,),
           ),

           //화살표
           Container(
             width: screenArrow,
             padding: EdgeInsets.all(0),
             child: null
           ),

           //네번째 캡쳐
           Container(
             width: screenCap,
             padding: EdgeInsets.all(0),
             child: null
           ),
         ],
       ),
       Row(
         children: [
           //첫번째 텍스트
           Container(
               width: screenCap,
               padding: EdgeInsets.zero,
               alignment: Alignment.topCenter,
               child: RichText(
                 text: const TextSpan(
                   children: <TextSpan>[
                     TextSpan(
                       text: '🎯',
                       style: TextStyle(
                         fontSize: 13, // Ensure this size matches the rest of the text if needed
                         color: Colors.red, // Emoji color
                       ),
                     ),
                     TextSpan(
                       text: '  회원가입은 사업자 / 일반가입으로 분류됩니다\n       사업자를 선택하고 다음버튼을 클릭해주세요.',
                       style: TextStyle(
                         fontFamily: 'AppleSDGothicNeo',
                         fontWeight: FontWeight.w400,
                         fontSize: 13,
                         color: Colors.black, // Text color
                       ),
                     ),
                   ],
                 ),
               )
           ),
           //화살표
           Container(
               width: screenArrow,
               padding: EdgeInsets.all(0),
               child: null
           ),

           //두번째 텍스트
           Container(
               width: screenCap,
               padding: EdgeInsets.all(0),
               alignment: Alignment.topCenter,
               child: RichText(
                 text: const TextSpan(
                   children: <TextSpan>[
                     TextSpan(
                       text: '🎯',
                       style: TextStyle(
                         fontSize: 13, // Ensure this size matches the rest of the text if needed
                         color: Colors.red, // Emoji color
                       ),
                     ),
                     TextSpan(
                       text: '  빈칸에 알맞는 정보를 입력해주시고,\n       가입 버튼을 눌러주세요.',
                       style: TextStyle(
                         fontFamily: 'AppleSDGothicNeo',
                         fontWeight: FontWeight.w400,
                         fontSize: 13,
                         color: Colors.black, // Text color
                       ),
                     ),
                   ],
                 ),
               )
           ),

           //화살표
           Container(
               width: screenArrow,
               padding: EdgeInsets.all(0),
               child: null
           ),

           //세번째 텍스트
           Container(
               width: screenCap,
               padding: EdgeInsets.all(0),
               alignment: Alignment.topCenter,
               child: RichText(
                 text: const TextSpan(
                   children: <TextSpan>[
                     TextSpan(
                       text: '🎯',
                       style: TextStyle(
                         fontSize: 13, // Ensure this size matches the rest of the text if needed
                         color: Colors.red, // Emoji color
                       ),
                     ),
                     TextSpan(
                       text: '  로그인을 진행 합니다.\n       첫로그인 후 자동로그인으로 이용하실 수 있습니다.',
                       style: TextStyle(
                         fontFamily: 'AppleSDGothicNeo',
                         fontWeight: FontWeight.w400,
                         fontSize: 13,
                         color: Colors.black, // Text color
                       ),
                     ),
                   ],
                 ),
               )
           ),

           //화살표
           Container(
               width: screenArrow,
               padding: EdgeInsets.all(0),
               child: null
           ),

           //네번째 텍스트
           Container(
               width: screenCap,
               padding: EdgeInsets.all(0),
               alignment: Alignment.topCenter,
               child: null
           ),
         ],
       ),
     ],
    );
  }
}