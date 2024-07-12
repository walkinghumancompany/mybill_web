import 'package:flutter/material.dart';
import 'package:mybill_web/models/colors_model.dart';

class MainDesktop extends StatefulWidget {
  final ScrollController scrollController;
  final bool isActive;
  final Key resetKey;
  const MainDesktop({
    required this.resetKey,
    required this.scrollController,
    required this.isActive,
  }) : super(key: resetKey);

  @override
  State<MainDesktop> createState() => _MainDesktopState();
}

class _MainDesktopState extends State<MainDesktop> {

  final GlobalKey _globalKey_home = GlobalKey();
  final GlobalKey _globalKey_introduce = GlobalKey();
  final GlobalKey _globalKey_business = GlobalKey();
  final GlobalKey _globalKey_citizen = GlobalKey();
  ColorsModel _colorsModel = ColorsModel();
  OverlayEntry? _overlayEntry;
  OverlayEntry? _overlayEntry_grid;
  String _currentImage = 'assets/menubar-home.png';
  String _currentMenu = 'HOME';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _updateOverlays();
    });
    widget.scrollController.addListener(_scrollListener);
  }

  @override
  void didUpdateWidget(MainDesktop oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.resetKey != oldWidget.resetKey) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _resetState();
      });
    } else if (widget.isActive != oldWidget.isActive) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (widget.isActive) {
          _addOverlays();
        } else {
          _removeOverlays();
        }
      });
    }
  }

  void _resetState() {
    setState(() {
      _currentImage = 'assets/menubar-home.png';
      _currentMenu = 'HOME';
    });
    _removeOverlays();
    widget.scrollController.jumpTo(0);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _addOverlays();
      }
    });
  }


  void _updateOverlays() {
    if (widget.isActive) {
      _addOverlays();
    } else {
      _removeOverlays();
    }
  }

  void _addOverlays() {
    _removeOverlays();  // 기존 오버레이를 먼저 제거
    if (mounted) {
      setState(() {
        _overlayEntry = _createOverlayEntry();
        _overlayEntry_grid = _overlayGrid();
      });
      Overlay.of(context)?.insert(_overlayEntry!);
      Overlay.of(context)?.insert(_overlayEntry_grid!);
    }
  }

  void _removeOverlays() {
    _overlayEntry?.remove();
    _overlayEntry_grid?.remove();
    _overlayEntry = null;
    _overlayEntry_grid = null;
  }

  void _scrollListener() {
    if (widget.scrollController.hasClients) {
      final scrollPosition = widget.scrollController.offset;
      String newMenu;
      String newImage;
      if (scrollPosition >= 0 && scrollPosition < 500) {
        newMenu = 'HOME';
        newImage = 'assets/menubar-home.png';
      } else if (scrollPosition >= 500 && scrollPosition < 950) {
        newMenu = '마이빌소개';
        newImage = 'assets/menubar-mybill.png';
      } else if (scrollPosition >= 950 && scrollPosition < 1690) {
        newMenu = '사업자플랫폼';
        newImage = 'assets/menubar-business.png';
      } else {
        newMenu = '소규모입주민회';
        newImage = 'assets/menubar-citizen.png';
      }

      if (_currentMenu != newMenu || _currentImage != newImage) {
        _updateCurrentMenuAndImage(newMenu, newImage);
      }
    }
  }

  void _updateCurrentMenuAndImage(String newMenu, String newImage) {
    setState(() {
      _currentMenu = newMenu;
      _currentImage = newImage;
    });
    _addOverlays();  // 오버레이를 완전히 재생성
  }

  void _updateCurrentMenu(String menu) {
    if (_currentMenu != menu) {
      setState(() {
        _currentMenu = menu;
      });
      _overlayEntry?.markNeedsBuild();
    }
  }


  void _updateImage(String imgPath) {
    if (_currentImage != imgPath) {
      setState(() {
        _currentImage = imgPath;
      });
    } _overlayEntry_grid?.markNeedsBuild();
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
        if (key.currentContext != null) {
          Scrollable.ensureVisible(
            key.currentContext!,
            duration: Duration(seconds: 1),
          );
        }
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
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }

  OverlayEntry _overlayGrid() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
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
              key: UniqueKey(),  // 매번 새로운 키를 생성하여 위젯을 강제로 재생성
              gaplessPlayback: false,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _currentImage;
    _removeOverlays();
    widget.scrollController.removeListener(_scrollListener);
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
