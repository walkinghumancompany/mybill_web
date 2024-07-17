import 'package:flutter/material.dart';
import 'package:mybill_web/models/colors_model.dart';
import 'package:provider/provider.dart';
import 'business_imageSliderTablet.dart';
import 'citizen_imageSliderTablet.dart';
import 'main.dart';

class MainTablet extends StatefulWidget {
  final ScrollController scrollController;
  final bool isActive;
  final Key resetKey;
  const MainTablet({
    required this.resetKey,
    required this.scrollController,
    required this.isActive,
  }) : super(key: resetKey);

  @override
  State<MainTablet> createState() => _MainTabletState();
}

class _MainTabletState extends State<MainTablet> {
  final GlobalKey _globalKey_home = GlobalKey();
  final GlobalKey _globalKey_introduce = GlobalKey();
  final GlobalKey _globalKey_business = GlobalKey();
  final GlobalKey _globalKey_citizen = GlobalKey();
  ColorsModel _colorsModel = ColorsModel();

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Stack(
        children: [
          Column(
            children: [
              Opacity(
                key: _globalKey_home,
                opacity: 0.1,
                child: Image.asset('assets/main.png',
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width * 1,
                 ),
              ),
              const SizedBox(
                height: 55,
              ),
              //-------------------서비스 소개--------------------
              Container(
                key: _globalKey_introduce,
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width * 1,
                child: Image.asset('assets/mainDesktop-app&web.png',
                  fit: BoxFit.contain,),
              ),
              const SizedBox(
                height: 65,
              ),
              //-------------------건물관리 사업자 01--------------------
              Container(
                key: _globalKey_business,
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width * 0.35,
                child: Image.asset('assets/main-business.png',
                  fit: BoxFit.contain,),
              ),
              const SizedBox(
                height: 75,
              ),
              BusinessImageSliderTablet(),
              const SizedBox(
                height: 65,
              ),
              //-------------------임대업 및 소규모입주민회 02--------------------
              Container(
                key: _globalKey_citizen,
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width * 0.35,
                child: Image.asset('assets/main-citizen.png',
                  fit: BoxFit.contain,),
              ),
              const SizedBox(
                height: 75,
              ),
              CitizenImageSliderTablet(),
              const SizedBox(
                height: 65,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.7,
                padding: EdgeInsets.all(20),
                child:
                GestureDetector(
                  onTap: () {
                    Provider.of<MainMobileState>(context, listen: false).setActive(false);
                    Navigator.of(context).pushReplacementNamed('/service_introduce');
                  },
                  child: Image.asset('assets/main-lastButton.png',
                    fit: BoxFit.contain,),
                ),
              ),
              const SizedBox(
                height: 55,
              )
            ],
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/desktopText01.png',
              fit: BoxFit.contain,
              height: 62,
            ),
          ),
          Positioned(
            top: 380,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/desktopText02.png',
              fit: BoxFit.contain,
              height: 9,
            ),
          ),
          Positioned(
            top: 400,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/arrow-down.png',
              fit: BoxFit.contain,
              height: 12,
            ),
          ),
          Positioned(
              top: 340,
              left: 0,
              right: 0,
              child: Image.asset('assets/circle.png',
                fit: BoxFit.contain,
                height: 120,)),
        ],
      );
  }
}
