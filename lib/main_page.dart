import 'package:flutter/material.dart';
import 'package:mybill_web/footer.dart';
import 'package:provider/provider.dart';
import 'calculator/classification_platform.dart';
import 'package:mybill_web/models/colors_model.dart';
import 'package:mybill_web/common_app_bar.dart';
import 'package:mybill_web/main_mobile.dart';
import 'main.dart';
import 'main_desktop.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ClassificationPlatform _classificationPlatform = ClassificationPlatform();
  ColorsModel _colorsModel = ColorsModel();
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MainDesktopState>(context, listen: false).setActive(true);
    });
    int deviceType = _classificationPlatform.classifyWithDevice(context: context);

    double widthMultiplier;
    switch (deviceType) {
      case 0: // 모바일
        widthMultiplier = 1.0;
        break;
      case 1: // 태블릿
        widthMultiplier = 0.8;
        break;
      case 2: // 웹
        widthMultiplier = 0.5;
        break;
      default:
        widthMultiplier = 1.0;
    }

    return Scaffold(
        appBar: CommonAppBar(
          title: '',
          deviceType: deviceType,
          widthMultiplier: widthMultiplier,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: _colorsModel.wh,
      body: Consumer<MainDesktopState>(
        builder: (context, mainDesktopState, child) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
                children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * widthMultiplier,
                      color: _colorsModel.wh,
                      child: Column(
                        children: [
                          if (deviceType == 0) MainMobile(
                              resetKey: UniqueKey(),
                              scrollController: _scrollController,
                              isActive: mainDesktopState.isActive
                          ),
                          if (deviceType == 1) _buildTabletLayout(),
                          if (deviceType == 2 && mainDesktopState.isActive) MainDesktop(
                            resetKey: UniqueKey(),
                            scrollController: _scrollController,
                            isActive: mainDesktopState.isActive,
                          ),
                          if (deviceType == 0) FooterMobile(),
                          if (deviceType == 1) FooterTablet(),
                          if (deviceType == 2) FooterDesktop()
                        ],
                      ),
                    ),
                  )
                ]
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Container(); // 태블릿 레이아웃 구현
  }

}