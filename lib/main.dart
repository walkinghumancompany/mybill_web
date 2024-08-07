import 'package:flutter/material.dart';
import 'package:mybill_web/main_mobile.dart';
import 'package:provider/provider.dart';
import 'package:mybill_web/service_introduce.dart';
import '/main_page.dart';
import 'inquiry_page.dart';
import 'faq_page.dart';
import 'main_desktop.dart';
import 'service_introduce.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainDesktopState()),
        ChangeNotifierProvider(create: (context) => MainMobileState()),
      ],
      child: const MybillWeb(),
    ),
  );
}
class MainMobileState extends ChangeNotifier {
  bool _isActive = true;

  bool get isActive => _isActive;

  void setActive(bool value) {
    _isActive = value;
    notifyListeners();
  }
  void reset() {
    _isActive = true;
    notifyListeners();
  }
}
class MainDesktopState extends ChangeNotifier {
  bool _isActive = true;

  bool get isActive => _isActive;

  void setActive(bool value) {
    _isActive = value;
    notifyListeners();
  }
  void reset() {
    _isActive = true;
    notifyListeners();
  }
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
      initialRoute: "/main",
      routes: {
        '/main': (context) => MainPage(),
        '/main_mobile': (context) => MainMobileWrapper(),
        '/main_desktop': (context) => MainDesktopWrapper(),
        '/service_introduce': (context) => ServiceIntroduce(),
        '/inquiry_page': (context) => Inquiry(),
        '/faq_page': (context) => FaqPage()
      },
    );
  }
}
class MainMobileWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainMobile(
      scrollController: ScrollController(),
      isActive: true, resetKey: UniqueKey(),
    );
  }
}

class MainDesktopWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainDesktop(
      scrollController: ScrollController(),
      isActive: true, resetKey: UniqueKey(),
    );
  }
}