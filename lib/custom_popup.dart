import 'package:flutter/material.dart';

class CustomPopupMenuButton extends StatelessWidget {
  final List<PopupMenuEntry<int>> menuItems;
  final Widget child;
  final Function(int) onSelected;
  final double offset;
  final Color backgroundColor; // 팝업 메뉴 배경 색상

  CustomPopupMenuButton({
    required this.menuItems,
    required this.child,
    required this.onSelected,
    this.offset = 10.0, // Default offset is 10 pixels
    this.backgroundColor = Colors.white, // Default background color is white
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final RenderBox button = context.findRenderObject() as RenderBox;
        final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
        final RelativeRect position = RelativeRect.fromRect(
          Rect.fromPoints(
            button.localToGlobal(Offset(0, button.size.height + offset), ancestor: overlay),
            button.localToGlobal(button.size.bottomRight(Offset.zero) + Offset(0, offset), ancestor: overlay),
          ),
          Offset.zero & overlay.size,
        );

        showMenu<int>(
          context: context,
          position: position,
          items: menuItems,
          color: backgroundColor, // 팝업 메뉴 배경 색상 적용
        ).then((int? result) {
          if (result != null) {
            onSelected(result);
          }
        });
      },
      child: child,
    );
  }
}