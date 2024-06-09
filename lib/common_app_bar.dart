import 'package:flutter/material.dart';
import 'package:mybill_web/models/colors_model.dart';
import 'custom_popup.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final int deviceType;
  final double widthMultiplier;
  final ColorsModel _colorsModel = ColorsModel();

  CommonAppBar({
    Key? key,
    required this.title,
    this.actions,
    required this.deviceType,
    required this.widthMultiplier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Container(
        width: MediaQuery.of(context).size.width * widthMultiplier,
        child: _buildTitle(context),
      ),
      backgroundColor: _colorsModel.wh,
      actions: actions,
    );
  }

  Widget _buildTitle(BuildContext context) {
    switch (deviceType) {
      case 0: // Mobile
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/main');
              },
              child: const Text(
                'MYBILL',
                style: TextStyle(
                  fontFamily: 'AppleSDGothicNeo',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Theme(
              data: ThemeData(
                popupMenuTheme: PopupMenuThemeData(
                  color: Colors.white,
                  elevation: 0, // 그림자 제거
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
              ),
              child: CustomPopupMenuButton(
                menuItems: const <PopupMenuEntry<int>>[
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text(
                      '견적문의',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo',
                        fontWeight: FontWeight.w500,
                        fontSize: 12.5,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text(
                      'FAQ',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo',
                        fontWeight: FontWeight.w500,
                        fontSize: 12.5,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
                onSelected: (int result) {
                  if (result == 0) {
                        Navigator.of(context).pushNamed('/inquiry_page');
                  } else if (result == 1) {
                        Navigator.of(context).pushNamed('/faq_page');
                  }
                },
                offset: 7.0,
                backgroundColor: Colors.white,
                child: Image.asset(
                  'assets/List.png',
                  width: 34,
                  height: 34,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        );
      case 1: // Tablet
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/main');
              },
              child: const Text(
                'MYBILL',
                style: TextStyle(
                  fontFamily: 'AppleSDGothicNeo',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Theme(
              data: ThemeData(
                popupMenuTheme: PopupMenuThemeData(
                  color: Colors.white,
                  elevation: 0, // 그림자 제거
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
              ),
              child: CustomPopupMenuButton(
                menuItems: const <PopupMenuEntry<int>>[
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text(
                      '견적문의',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo',
                        fontWeight: FontWeight.w500,
                        fontSize: 12.5,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text(
                      'FAQ',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo',
                        fontWeight: FontWeight.w500,
                        fontSize: 12.5,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
                onSelected: (int result) {
                  // Handle menu item selection here
                  if (result == 0) {
                    Navigator.of(context).pushNamed('/inquiry_page');
                  } else if (result == 1) {
                    Navigator.of(context).pushNamed('/faq_page');
                  }
                },
                offset: 7.0,
                backgroundColor: Colors.white,
                child: Image.asset(
                  'assets/List.png',
                  width: 34,
                  height: 34,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        );
      case 2: // Web
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/main'); // Adjust route as needed
              },
              child: const Text(
                'MYBILL',
                style: TextStyle(
                  fontFamily: 'AppleSDGothicNeo',
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Theme(
              data: ThemeData(
                popupMenuTheme: PopupMenuThemeData(
                  color: Colors.white,
                  elevation: 0, // 그림자 제거
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
              ),
              child: CustomPopupMenuButton(
                menuItems: const <PopupMenuEntry<int>>[
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text(
                      '건물관리 사업자 플랫폼',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo',
                        fontWeight: FontWeight.w500,
                        fontSize: 12.5,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text(
                      '임대업 및 소규모 입주민회',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo',
                        fontWeight: FontWeight.w500,
                        fontSize: 12.5,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
                onSelected: (int result) {
                  if (result == 0) {

                  } else if (result == 1) {
                    // Handle "임대업 및 소규모 입주민회"
                  }
                },
                offset: 12.0,
                backgroundColor: Colors.white,
                child: const Text(
                  '서비스소개',
                  style: TextStyle(
                    fontFamily: 'AppleSDGothicNeo',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ), // Set the desired offset
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/inquiry_page');
              },
              child: Text(
                '견적문의',
                style: TextStyle(
                  fontFamily: 'AppleSDGothicNeo',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: ModalRoute.of(context)?.settings.name == '/inquiry_page' ? const Color(0xFF1F5372)
                  : Colors.black,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/faq_page');
              },
              child: Text(
                'FAQ',
                style: TextStyle(
                  fontFamily: 'AppleSDGothicNeo',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: ModalRoute.of(context)?.settings.name == '/faq_page' ? const Color(0xFF1F5372) : Colors.black
                ),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            GestureDetector(
              onTap: () async {
                const url = 'http://mybill.biz';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Image.asset(
                'assets/Logo.png',
                width: 28,
                height: 28,
                fit: BoxFit.contain,
              ),
            ),
          ],
        );
      default:
        return Text(title);
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}