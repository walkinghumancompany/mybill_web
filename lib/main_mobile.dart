import 'package:flutter/material.dart';
import 'package:mybill_web/models/colors_model.dart';

class MainMobile extends StatefulWidget {
  final ScrollController scrollController;
  const MainMobile({Key? key, required this.scrollController}) : super(key: key);

  @override
  State<MainMobile> createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile> {
  final GlobalKey _globalKey_home = GlobalKey();
  final GlobalKey _globalKey_introduce = GlobalKey();
  final GlobalKey _globalKey_business = GlobalKey();
  final GlobalKey _globalKey_citizen = GlobalKey();
  ColorsModel _colorsModel = ColorsModel();
  late OverlayEntry _overlayEntry;
  late OverlayEntry _overlayEntry_grid;
  String _currentImage = 'assets/menubar-home.png';
  String _currentMenu = 'HOME';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _overlayEntry = _createOverlayEntry();
      _overlayEntry_grid = _overlayGrid();
      Overlay.of(context)?.insert(_overlayEntry);
      Overlay.of(context)?.insert(_overlayEntry_grid);
      widget.scrollController.addListener(_scrollListener);
    });
  }

  void _scrollListener() {
    if (widget.scrollController.hasClients) {
      final scrollPosition = widget.scrollController.offset;
      if (scrollPosition >= 0 && scrollPosition < 500) {
        _updateImage('assets/menubar-home.png');
        _updateCurrentMenu('HOME');
      } else if (scrollPosition >= 500 && scrollPosition < 950) {
        _updateImage('assets/menubar-mybill.png');
        _updateCurrentMenu('마이빌소개');
      } else if (scrollPosition >= 950 && scrollPosition < 1690) {
        _updateImage('assets/menubar-business.png');
        _updateCurrentMenu('사업자플랫폼');
      } else if (scrollPosition >= 1690) {
        _updateImage('assets/menubar-citizen.png');
        _updateCurrentMenu('소규모입주민회');
      }
      setState(() {});
    }
  }
  void _updateCurrentMenu(String menu) {
    if (_currentMenu != menu) {
      setState(() {
        _currentMenu = menu;
      });
      _overlayEntry.markNeedsBuild();
    }
  }


  void _updateImage(String imgPath) {
    if (_currentImage != imgPath) {
      setState(() {
        _currentImage = imgPath;
      });
    } _overlayEntry_grid.markNeedsBuild();
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.3,
        right: MediaQuery.of(context).size.width * 0.29,
        child: Container(
            width: 100,
            height: 120,
            child: Column(
              children: [
                _buildMenuItem('HOME', _globalKey_home),
                _buildMenuItem('마이빌소개', _globalKey_introduce),
                _buildMenuItem('사업자플랫폼', _globalKey_business),
                _buildMenuItem('소규모입주민회', _globalKey_citizen),
              ],
            )
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, GlobalKey key) {
    return GestureDetector(
      onTap: () {
        Scrollable.ensureVisible(
          key.currentContext!,
          duration: Duration(seconds: 1),
        );
        _updateCurrentMenu(title);
      },
      child: Container(
        alignment: Alignment.centerRight,
        height: 25,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'AppleSDGothicNeo',
            fontWeight: FontWeight.w500,
            fontSize: 11,
            color: _currentMenu == title ? _colorsModel.main : _colorsModel.gr1, // 수정
          ),
        ),
      ),
    );

  }

  OverlayEntry _overlayGrid() {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.3,
        right: MediaQuery.of(context).size.width * 0.29 - 60,
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 5),
          width: 50,
          height: 120,
          child: Image.asset(
            _currentImage,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    _overlayEntry.remove();
    _overlayEntry_grid.remove();
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
                  // width: MediaQuery.of(context).size.width * 1,
                  height: 450,),
              ),
              const SizedBox(
                height: 70,
              ),
              //-------------------서비스 소개--------------------
              Container(
                key: _globalKey_introduce,
                alignment: Alignment.topCenter,
                height: 85,
                child: Image.asset('assets/main-app&web.png',
                  fit: BoxFit.contain,),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topCenter,
                height: 280,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1
                    )
                ),
              ),
              const SizedBox(
                height: 75,
              ),
              //-------------------건물관리 사업자 01--------------------
              Container(
                key: _globalKey_business,
                alignment: Alignment.topCenter,
                height: 25,
                child: Image.asset('assets/mainNumber01.png',
                  fit: BoxFit.contain,),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topCenter,
                height: 85,
                child: Image.asset('assets/main-business.png',
                  fit: BoxFit.contain,),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.topCenter,
                height: 55,
                child: Image.asset('assets/mainDownArrow.png',
                  fit: BoxFit.contain,),
              ),
              const SizedBox(
                height: 75,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/main-business01.png',
                  width: MediaQuery.of(context).size.width * 1,
                  fit: BoxFit.contain,),
              ),
              const SizedBox(
                height: 75,
              ),
              //-------------------임대업 및 소규모입주민회 02--------------------
              Container(
                key: _globalKey_citizen,
                alignment: Alignment.topCenter,
                height: 25,
                child: Image.asset('assets/mainNumber02.png',
                  fit: BoxFit.contain,),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topCenter,
                height: 85,
                child: Image.asset('assets/main-citizen.png',
                  fit: BoxFit.contain,),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.topCenter,
                height: 55,
                child: Image.asset('assets/mainDownArrow.png',
                  fit: BoxFit.contain,),
              ),
              const SizedBox(
                height: 75,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/main-business02.png',
                  width: MediaQuery.of(context).size.width * 1,
                  fit: BoxFit.contain,),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                height: 75,
                padding: EdgeInsets.all(20),
                child: Image.asset('assets/main-lastButton.png',
                  fit: BoxFit.contain,),
              ),
              const SizedBox(
                height: 100,
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
              height: 72,
            ),
          ),
          Positioned(
            top: 410,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/desktopText02.png',
              fit: BoxFit.contain,
              height: 9,
            ),
          ),
          Positioned(
            top: 435,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/arrow-down.png',
              fit: BoxFit.contain,
              height: 12,
            ),
          ),
          Positioned(
              top: 365,
              left: 0,
              right: 0,
              child: Image.asset('assets/circle.png',
                fit: BoxFit.contain,
                height: 120,)),
        ],
      );
  }
}
