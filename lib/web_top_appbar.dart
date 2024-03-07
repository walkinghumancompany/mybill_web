import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '/icons.dart';
import 'package:mybill_web/models/colors_model.dart';
import 'main_page.dart';

class TopAppBar extends StatelessWidget {
  final double widthMultiplier;
  final ColorsModel colorsModel = ColorsModel();

  TopAppBar({Key? key, required this.widthMultiplier}) : super(key: key);

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width * widthMultiplier,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => main_page()),
              );
            },
            child: Container(
              height: 100,
              width: 150,
              child: Image.asset('assets/icons/web_appbar_icon.png'),
            ),
          ),
          GestureDetector(
            onTap: () => _launchURL('https://mybill.biz'),
            child: Container(
              height: 100,
              width: 100,
              alignment: Alignment.center,
              child: Icon(
                MyFlutterApp.connectdevelop,
                color: colorsModel.main,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
