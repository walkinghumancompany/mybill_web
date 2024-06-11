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
      "answer": "네, 건물을 하나만 소유한 경우에도 가입할 수 있습니다. 건물의 가구 수는 중요하지 않습니다. 작은 건물이든 큰 건물이든 참여를 환영합니다. 등록절차에 대해 언제든지 문의해 주시기 바랍니다."
    },
    {
      "question": "가입과 이용절차를 알려주세요.",
      "answer": "서비스를 등록하고 사용하려면 다음 단계를 따르십시오.\n\n"
          "사업자 또는 임대업, 입주민회\n"
          "1. '마이빌'과 견적을 협의하여 사용료를 책정합니다. \n"
          "2. App Store 또는 Google Play에서 '마이빌'을 검색하여 다운로드하십시오.\n"
          "3. 앱을 클릭하고 '회원가입'의 '사업자' 버튼을 클릭하세요.\n"
          "4. 필수 정보를 입력하여 등록을 완료하세요.\n"
          "마이빌의 승인이 완료되면 자유롭게 서비스를 이용하실 수 있습니다. 등록 과정 중에 질문이 있거나 도움이 필요하면 주저하지 말고 지원팀에 문의하세요.\n\n"
          "일반 입주민\n"
          "1. App Store 또는 Google Play에서 '마이빌'을 검색하여 다운로드하십시오.\n"
          "2. 앱을 클릭하고 '회원가입'의 '일반회원' 버튼을 클릭하세요.\n"
          "3. 필수 정보를 입력하여 등록을 완료하세요.\n"
          "해당건물의 사업자 혹은 관리자의 승인이 완료되면 서비스를 이용하실 수 있습니다. 보다 편리하게 관리비납부가 가능하며 공지사항, 민원등 편리한 기능들을 이용하실 수 있습니다.\n"
    },
    {
      "question": "건물관리 사업자 입니다. 이용료를 알고 싶습니다.",
      "answer": "마이빌 플랫폼은 가구 수에 따라 요금을 청구합니다. 요금은 가구당 400원에서 4,000원 까지 다양합니다. 자세한 견적을 원하시면 1588-3988로 전화주세요. 우리 팀은 귀하의 요구에 맞는 구체적인 가격 정보를 기꺼이 제공할 것입니다."
    },
    {
      "question": "온라인 고지서와 종이고지서 전부 발급이 가능한가요?",
      "answer": "물론입니다. 마이빌은 종이 청구서와 온라인 청구서 발행 서비스를 모두 제공합니다. 온라인 청구서는 카카오 알림톡이나 SMS로 보낼 수 있으며, 청구서를 직접 인쇄하거나 인쇄를 요청하여 택배수령을 하실수도 있습니다."
    },
    {
      "question": "입주민의 관리비 결제는 어떤방식으로 이루어지나요?",
      "answer": "사업자들의 가장 큰 고민인 관리비 징수 문제를 해결하기 위해 마이빌에서는 카카오 알림톡으로 청구서가 오면 주민이 즉시 카드결제를 할 수 있는 기능을 도입했습니다."
          "기존과 같이 계좌이체나 자동이체서비스를 등록하여 관리비를 수납할 수 있으며, 마이빌을 통하여 카드납부 혹은 간편납부를 이용 할 수 있습니다."
          "카드납부된 관리비는 해당 입주민회의 통장이나 등록된 계좌로 자동이체 됩니다."
    },
    {
      "question": "입주민의 데이터 보관은 얼만큼 하나요?",
      "answer": "입주민의 데이터는 입주민이 이사를 나가더라도 기본적으로 2년 동안 저장됩니다."
          "저장된 데이터는 입주자의 동의 없이 공개되지 않습니다. 입주민 퇴사 시 데이터 삭제를 원할 경우 요청할 수 있으며, 해당 데이터는 즉시 삭제됩니다."
    },
    {
      "question": "이사를 나갈때의 정산은 어떻게 하나요?",
      "answer": "'마이빌'에는 이사 정산 기능이 포함되어 있습니다. 입주민이 이사를 나갈때 검침값만 입력하면 일할 계산이 되어 고지서가 발행됩니다."
    },
    {
      "question": "관리 건물이 여러 개 있는 경우 각 건물에 대한 지출을 어떻게 관리하나요?",
      "answer": "'마이빌'에는 포괄적인 비용 관리 기능이 포함되어 있습니다. 각 건물의 지출 내역 검토, 관리업체 관리, 회계결산 처리 등을 통해 각각의 건물을 독립적으로 관리할 수 있습니다. 이를 통해 혼란 없이 여러 건물의 재정적 측면을 효율적으로 관리할 수 있습니다."
    },
    {
      "question": "검침은 어떤 방식으로 할 수 있나요?",
      "answer": "'마이빌' 애플리케이션에는 검침 기능이 포함되어 있습니다. 해당 세대의 검침량을 휴대폰으로 입력하시면 자동으로 요금이 계산됩니다."
          "또한 검침원임명 기능을 포함합니다.지정된 검침원은 마이빌 검침원 전용 애플리케이션을 사용하여 접근 권한이 있는 건물의 검침값을 휴대폰에 직접 입력할 수 있습니다. 이러한 검침값은 사업자의 휴대폰과 웹에서 모두 관리할 수 있습니다."
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
        const SizedBox(
          height: 50,
        )
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
        const SizedBox(
          height: 50,
        )
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
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

}
