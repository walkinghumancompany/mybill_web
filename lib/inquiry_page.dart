import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'calculator/classification_platform.dart';
import 'package:mybill_web/models/colors_model.dart';
import 'package:mybill_web/common_app_bar.dart';
import 'main.dart';


class Inquiry extends StatefulWidget {
  const Inquiry({Key? key}) : super(key: key);

  @override
  State<Inquiry> createState() => _InquiryState();
}

class _InquiryState extends State<Inquiry> {

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
    return Scaffold(
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 100,
        ),
        Container(
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF1F5372),
              width: 1.25,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text('견적문의',
          style: TextStyle(
            fontFamily: 'AppleSDGothicNeo',
            fontWeight: FontWeight.w700,
            fontSize: 21,
            color: Colors.black,
          ),),
        const SizedBox(
          height: 12,
        ),
        const Text('가장빠른 견적을 받으실 수 있습니다.',
          style: TextStyle(
            fontFamily: 'AppleSDGothicNeo',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xFF1F5372),
          ),),
        const SizedBox(
          height: 50,
        ),
        const Text('1566-3988',
          style: TextStyle(
            fontFamily: 'AppleSDGothicNeo',
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black,
          ),),
        const SizedBox(
          height: 14,
        ),
        TextButton(
            onPressed: _makePhoneCall,
            child: Container(
              alignment: Alignment.center,
              width: 140,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Color(0xFF1F5372),
                  width: 1,
                ),
              ),
              child: const Text('전 화 걸 기',
              style: TextStyle(
                fontFamily: 'AppleSDGothicNeo',
                fontWeight: FontWeight.w500,
                fontSize: 15.7,
                color: Color(0xFF1F5372),
              ),),
            ))
      ],
    );
  }
  void _makePhoneCall() async {
    const phoneNumber = 'tel:15663988';
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  Widget _buildTabletLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 100,
        ),
        Container(
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF1F5372),
              width: 1.25,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text('견적문의',
          style: TextStyle(
            fontFamily: 'AppleSDGothicNeo',
            fontWeight: FontWeight.w700,
            fontSize: 21,
            color: Colors.black,
          ),),
        const SizedBox(
          height: 12,
        ),
        const Text('가장빠른 견적을 받으실 수 있습니다.',
          style: TextStyle(
            fontFamily: 'AppleSDGothicNeo',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xFF1F5372),
          ),),
        const SizedBox(
          height: 50,
        ),
        const Text('1566-3988',
          style: TextStyle(
            fontFamily: 'AppleSDGothicNeo',
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black,
          ),)
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 100,
        ),
        Container(
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF1F5372),
              width: 1.25,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text('견적문의',
          style: TextStyle(
            fontFamily: 'AppleSDGothicNeo',
            fontWeight: FontWeight.w700,
            fontSize: 21,
            color: Colors.black,
          ),),
        const SizedBox(
          height: 12,
        ),
        const Text('가장빠른 견적을 받으실 수 있습니다.',
          style: TextStyle(
            fontFamily: 'AppleSDGothicNeo',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xFF1F5372),
          ),),
        const SizedBox(
          height: 50,
        ),
        const Text('1566-3988',
          style: TextStyle(
            fontFamily: 'AppleSDGothicNeo',
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black,
          ),)
      ],
    );
  }

}
