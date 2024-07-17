import 'package:flutter/cupertino.dart';
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
          height: 180,
          width: MediaQuery.of(context).size.width * 1,
          color: Colors.black,
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Image.asset(
                'assets/footerMobileText.png',
                fit: BoxFit.contain,
                height: 170,
              ),
            ),
          ),
        ),
        Container(
          height: 85,
          width: MediaQuery.of(context).size.width * 1,
          color: Colors.black,
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 30, top: 30),
              child: Image.asset(
                'assets/footerLogo.png',
                fit: BoxFit.contain,
                height: 24,
              ),
            ),
          ),
        ),
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
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, bottom: 0),
                height: 85,
                child: Image.asset('assets/footerText.png',
                  fit: BoxFit.contain,),
              ),
              Container(
                height: 23,
                padding: EdgeInsets.only(right: 35, bottom: 0),
                child: Image.asset('assets/footerLogo.png',
                  fit: BoxFit.contain,),
              )
            ],
          ),
        ),
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
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, bottom: 0),
                height: 110,
                child: Image.asset('assets/footerText.png',
                fit: BoxFit.contain,),
              ),
              Container(
                height: 27.5,
                padding: EdgeInsets.only(right: 80, bottom: 0),
                child: Image.asset('assets/footerLogo.png',
                fit: BoxFit.contain,),
              )
            ],
          ),
        ),
      ],
    );
  }
}