import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'calculator/classification_platform.dart';
import 'package:mybill_web/models/colors_model.dart';
import 'package:mybill_web/common_app_bar.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {

  ClassificationPlatform _classificationPlatform = ClassificationPlatform();
  ColorsModel _colorsModel = ColorsModel();

  final List<Map<String, String>> faqList = [
    {
      "question": "일반 집합건물주 입니다. 건물이 한채만 있어도 가입이 가능한가요?",
      "answer": ""
    },
    {
      "question": "가입과 이용절차를 알려주세요.",
      "answer": ""
    },
    {
      "question": "건물관리 사업자 입니다. 이용료를 알고 싶습니다.",
      "answer": "마이빌 플랫폼은 세대수에 따른 요금이 부과됩니다. 세대당 400원 부터 4,000원까지 다양 합니다. 자세한 견적문의는 1588-3988로 전화문의 부탁드립니다."
    },
    {
      "question": "온라인 고지서와 종이고지서 전부 발급이 가능한가요?",
      "answer": ""
    },
    {
      "question": "입주민의 관리비 결제는 어떤방식으로 이루어지나요?",
      "answer": ""
    },
    {
      "question": "입주민의 데이터 보관은 얼만큼 하나요?",
      "answer": ""
    },
    {
      "question": "이사를 나갈때의 정산은 어떻게 하나요?",
      "answer": ""
    },
    {
      "question": "관리건물이 여러개의 경우 각각의 지출관리를 어떻게 하나요?",
      "answer": ""
    },
    {
      "question": "검침은 어떤 방식으로 할 수 있나요?",
      "answer": ""
    },
  ];

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
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
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
        const Text('FAQ',
          style: TextStyle(
            fontFamily: 'AppleSDGothicNeo',
            fontWeight: FontWeight.w700,
            fontSize: 21,
            color: Colors.black,
          ),),
        const SizedBox(
          height: 12,
        ),
        const Text('자주 묻는 질문을 확인해보세요.',
          style: TextStyle(
            fontFamily: 'AppleSDGothicNeo',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.black,
          ),),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: faqList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Card(
                  elevation: 0,
                  color: _colorsModel.gr5,
                  child:
                    Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child:ExpansionTile(
                        leading: Text(
                          '${index+1}.'.padLeft(3, '0'),
                          style: const TextStyle(
                            fontFamily: 'AppleSDGothicNeo',
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: Color(0xff1F5372),
                          ),
                        ),
                        title: Text(
                          faqList[index]['question']!,
                          style: const TextStyle(
                            fontFamily: 'AppleSDGothicNeo',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.2,
                          ),
                        ),
                        trailing: const Icon(
                            Icons.add,
                            color: Color(0xff1F5372),
                        ),
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Divider(
                              color: Color(0xffCCCCCC),
                              thickness: 1,
                              height: 1,
                            ),
                          ),
                          const SizedBox(height: 9),
                          faqList[index]['answer']!.isNotEmpty
                              ?
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(faqList[index]['answer']!,
                              style: const TextStyle(
                                fontFamily: 'AppleSDGothicNeo',
                                fontWeight: FontWeight.w500,
                                fontSize: 14.2,
                              ),
                            ),
                          )
                              : Container(),
                          const SizedBox(height: 16),
                        ],
                      ),
                    )
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget _buildTabletLayout() {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
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
        const Text('FAQ',
          style: TextStyle(
            fontFamily: 'AppleSDGothicNeo',
            fontWeight: FontWeight.w700,
            fontSize: 21,
            color: Colors.black,
          ),),
        const SizedBox(
          height: 12,
        ),
        const Text('자주 묻는 질문을 확인해보세요.',
          style: TextStyle(
            fontFamily: 'AppleSDGothicNeo',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.black,
          ),),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: faqList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Card(
                    elevation: 0,
                    color: _colorsModel.gr5,
                    child:
                    Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child:ExpansionTile(
                        leading: Text(
                          '${index+1}.'.padLeft(3, '0'),
                          style: const TextStyle(
                            fontFamily: 'AppleSDGothicNeo',
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: Color(0xff1F5372),
                          ),
                        ),
                        title: Text(
                          faqList[index]['question']!,
                          style: const TextStyle(
                            fontFamily: 'AppleSDGothicNeo',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.2,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.add,
                          color: Color(0xff1F5372),
                        ),
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Divider(
                              color: Color(0xffCCCCCC),
                              thickness: 2,
                              height: 1,
                            ),
                          ),
                          const SizedBox(height: 9),
                          faqList[index]['answer']!.isNotEmpty
                              ?
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(faqList[index]['answer']!,
                              style: const TextStyle(
                                fontFamily: 'AppleSDGothicNeo',
                                fontWeight: FontWeight.w500,
                                fontSize: 14.2,
                              ),
                            ),
                          )
                              : Container(),
                          const SizedBox(height: 16),
                        ],
                      ),
                    )
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

  Widget _buildDesktopLayout() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
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
          const Text('FAQ',
            style: TextStyle(
              fontFamily: 'AppleSDGothicNeo',
              fontWeight: FontWeight.w700,
              fontSize: 21,
              color: Colors.black,
            ),),
          const SizedBox(
            height: 12,
          ),
          const Text('자주 묻는 질문을 확인해보세요.',
            style: TextStyle(
              fontFamily: 'AppleSDGothicNeo',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.black,
            ),),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: faqList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Card(
                      elevation: 0,
                      color: _colorsModel.gr5,
                      child:
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child:ExpansionTile(
                          leading: Text(
                            '${index+1}.'.padLeft(3, '0'),
                            style: const TextStyle(
                              fontFamily: 'AppleSDGothicNeo',
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Color(0xff1F5372),
                            ),
                          ),
                          title: Text(
                            faqList[index]['question']!,
                            style: const TextStyle(
                              fontFamily: 'AppleSDGothicNeo',
                              fontWeight: FontWeight.w500,
                              fontSize: 13.2,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.add,
                            color: Color(0xff1F5372),
                          ),
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Divider(
                                color: Color(0xffCCCCCC),
                                thickness: 2,
                                height: 1,
                              ),
                            ),
                            const SizedBox(height: 9),
                            faqList[index]['answer']!.isNotEmpty
                                ?
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(faqList[index]['answer']!,
                                style: const TextStyle(
                                  fontFamily: 'AppleSDGothicNeo',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.2,
                                ),
                              ),
                            )
                                : Container(),
                            const SizedBox(height: 16),
                          ],
                        ),
                      )
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}
