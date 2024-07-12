import 'package:flutter/material.dart';
import 'package:mybill_web/models/colors_model.dart';
import 'package:mybill_web/common_app_bar.dart';
import 'package:provider/provider.dart';
import 'calculator/classification_platform.dart';
import 'main.dart';


class ServiceIntroduce extends StatefulWidget {
  const ServiceIntroduce({Key? key}) : super(key: key);

  @override
  State<ServiceIntroduce> createState() => _ServiceIntroduceState();
}

class _ServiceIntroduceState extends State<ServiceIntroduce> {

  ClassificationPlatform _classificationPlatform = ClassificationPlatform();
  ColorsModel _colorsModel = ColorsModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MainDesktopState>(context, listen: false).setActive(false);
    });
  }

  @override
  Widget build(BuildContext context) {
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
    return
      Scaffold(
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
                          if (deviceType == 0)  _buildMobileLayout(),
                          if (deviceType == 1)  _buildTabletLayout(),
                          if (deviceType == 2)  _buildDesktopLayout(),
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
    return Container();
}
  Widget _buildTabletLayout() {
    return Container();
  }
  Widget _buildDesktopLayout() {
    return Container();
  }
}
