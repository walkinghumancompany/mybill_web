import 'package:flutter/material.dart';


class FooterMobile extends StatelessWidget {
  const FooterMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey,
        ),
        Container(
          height: 170,
          color: Color(0xffF9F9F9),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.68,
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'MYBILL',
                        style: TextStyle(
                          fontFamily: 'AppleSDGothicNeo',
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        '상호명 : 주식회사 마이빌',
                        style: TextStyle(
                          fontFamily: 'AppleSDGothicNeo',
                          fontWeight: FontWeight.w500,
                          fontSize: 13.5,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2.5,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        '대표 : 최훈',
                        style: TextStyle(
                          fontFamily: 'AppleSDGothicNeo',
                          fontWeight: FontWeight.w500,
                          fontSize: 13.5,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2.5,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        '사업자등록번호 : 199-88-02887',
                        style: TextStyle(
                          fontFamily: 'AppleSDGothicNeo',
                          fontWeight: FontWeight.w500,
                          fontSize: 13.5,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2.5,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        '주소 : 경상남도 하동군 금남면 큰삼내길2',
                        style: TextStyle(
                          fontFamily: 'AppleSDGothicNeo',
                          fontWeight: FontWeight.w500,
                          fontSize: 13.5,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.32,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 42,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      child: const Text('고객센터',
                        style: TextStyle(
                          fontFamily: 'AppleSDGothicNeo',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black,
                        ),),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      child: const Text('1566-3988',
                        style: TextStyle(
                          fontFamily: 'AppleSDGothicNeo',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black,
                        ),),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class FooterTablet extends StatelessWidget {
  const FooterTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey,
        ),
        Container(
          height: 155,
          color: Color(0xffF9F9F9),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'MYBILL',
                        style: TextStyle(
                          fontFamily: 'AppleSDGothicNeo',
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        '상호명 : 주식회사 마이빌',
                        style: TextStyle(
                          fontFamily: 'AppleSDGothicNeo',
                          fontWeight: FontWeight.w500,
                          fontSize: 13.5,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2.5,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        '대표 : 최훈',
                        style: TextStyle(
                          fontFamily: 'AppleSDGothicNeo',
                          fontWeight: FontWeight.w500,
                          fontSize: 13.5,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2.5,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        '사업자등록번호 : 199-88-02887',
                        style: TextStyle(
                          fontFamily: 'AppleSDGothicNeo',
                          fontWeight: FontWeight.w500,
                          fontSize: 13.5,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2.5,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        '주소 : 경상남도 하동군 금남면 큰삼내길2',
                        style: TextStyle(
                          fontFamily: 'AppleSDGothicNeo',
                          fontWeight: FontWeight.w500,
                          fontSize: 13.5,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      child: const Text('고객센터',
                        style: TextStyle(
                          fontFamily: 'AppleSDGothicNeo',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black,
                        ),),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      child: const Text('1566-3988',
                        style: TextStyle(
                          fontFamily: 'AppleSDGothicNeo',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black,
                        ),),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class FooterDesktop extends StatelessWidget {
  const FooterDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey,
        ),
        Container(
          height: 155,
          color: Color(0xffF9F9F9),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.35,
                padding: const EdgeInsets.only(left: 24),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'MYBILL',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '상호명 : 주식회사 마이빌',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo',
                        fontWeight: FontWeight.w500,
                        fontSize: 13.5,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 2.5),
                    Text(
                      '대표 : 최훈',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo',
                        fontWeight: FontWeight.w500,
                        fontSize: 13.5,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 2.5),
                    Text(
                      '사업자등록번호 : 199-88-02887',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo',
                        fontWeight: FontWeight.w500,
                        fontSize: 13.5,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 2.5),
                    Text(
                      '주소 : 경상남도 하동군 금남면 큰삼내길2',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo',
                        fontWeight: FontWeight.w500,
                        fontSize: 13.5,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.15,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '고객센터',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 9),
                    Text(
                      '1566-3988',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}