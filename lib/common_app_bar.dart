import 'package:flutter/material.dart';
import 'package:mybill_web/models/colors_model.dart';
import 'package:provider/provider.dart';
import 'custom_popup.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';

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
              child: Image.asset('assets/mybillLogo.png',
              fit: BoxFit.contain,
              height: 24,)
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
                      '서비스소개',
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
                    value: 2,
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
                    Provider.of<MainMobileState>(context, listen: false).setActive(false);
                    Navigator.of(context).pushReplacementNamed('/service_introduce');
                  } else if (result == 1) {
                    Provider.of<MainMobileState>(context, listen: false).setActive(false);
                    Navigator.of(context).pushReplacementNamed('/inquiry_page');
                  }
                  else if (result == 2) {
                    Provider.of<MainMobileState>(context, listen: false).setActive(false);
                    Navigator.of(context).pushReplacementNamed('/faq_page');
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
              child: Image.asset('assets/mybillLogo.png',
                fit: BoxFit.contain,
                height: 24,)
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
                      '서비스소개',
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
                    value: 2,
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
                    Navigator.of(context).pushNamed('/service_introduce');
                  } else if (result == 1) {
                    Navigator.of(context).pushNamed('/inquiry_page');
                  }
                  else if (result == 2) {
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
                  Provider.of<MainDesktopState>(context, listen: false).setActive(true);
                  Navigator.of(context).pushReplacementNamed('/main');
                },
                child: Image.asset('assets/mybillLogo.png',
                  fit: BoxFit.contain,
                  height: 24,)
            ),
            const SizedBox(
              width: 50,
            ),
            GestureDetector(
              onTap: () {
                Provider.of<MainDesktopState>(context, listen: false).setActive(false);
                Navigator.of(context).pushReplacementNamed('/service_introduce');
              },
              child: Text(
                '서비스소개',
                style: TextStyle(
                  fontFamily: 'AppleSDGothicNeo',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: ModalRoute.of(context)?.settings.name == '/service_introduce' ? const Color(0xFF1F5372)
                      : Colors.black,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Provider.of<MainDesktopState>(context, listen: false).setActive(false);
                Navigator.of(context).pushReplacementNamed('/inquiry_page');
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
                Provider.of<MainDesktopState>(context, listen: false).setActive(false);
                Navigator.of(context).pushReplacementNamed('/faq_page');
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