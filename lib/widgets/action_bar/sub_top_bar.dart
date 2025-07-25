import 'package:chinese_font_library/chinese_font_library.dart';
import 'package:flutter/material.dart';
import 'package:once_power/constants/num.dart';
import 'package:once_power/widgets/common/click_icon.dart';

class SubTopBar extends StatelessWidget {
  const SubTopBar({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      alignment: Alignment.centerLeft,
      padding:
          EdgeInsets.only(left: AppNum.detailDialogP, right: AppNum.largeG),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 13, color: Colors.grey)
                .useSystemChineseFont(),
          ),
          ClickIcon(
            size: 20,
            iconSize: 16,
            icon: icon,
            color: Colors.grey,
            onTap: onTap,
          )
        ],
      ),
    );
  }
}
