import 'package:flutter/material.dart';
import '/main_page.dart';
import 'inquiry_page.dart';

void main() {
  runApp(const MybillWeb());
}

class MybillWeb extends StatelessWidget {
  const MybillWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '마이빌 설명서',
      theme: ThemeData(
          fontFamily: 'AppleSDGothicNeo'
      ),
      color: Color(0xffF1EEDE),
      initialRoute: "/main_page",
      routes: {
        '/main_page': (context) => main_page(),
        '/main': (context) => main_page(),
        '/inquiry_page': (context) => Inquiry()
      },
    );
  }
}

