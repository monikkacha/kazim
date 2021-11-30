import 'package:flutter/material.dart';
import 'package:project_beta/services/learning_zone/learning_zone_getx_controller.dart';
import 'package:project_beta/src/extensions/common_extension.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class LearningZoneTabItem extends StatelessWidget {
  final String text;
  final VoidCallback onTabClick;
  final LearningZoneCurrentTab defaultTab;
  final LearningZoneCurrentTab activeTab;

  LearningZoneTabItem(
      {required this.text,
      required this.onTabClick,
      required this.defaultTab,
      required this.activeTab});

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: AppColor.primaryColor, width: 1.4));

    TextStyle textStyle = TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColor.primaryColor,
        fontSize: 16.0);

    if (defaultTab == activeTab) {
      decoration = BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(color: AppColor.primaryColor, width: 1.4));
      textStyle = TextStyle(
          fontWeight: FontWeight.bold, color: AppColor.white, fontSize: 16.0);
    }

    return Expanded(
        child: Material(
      child: InkWell(
        onTap: onTabClick,
        child: Ink(
          decoration: decoration,
          child: Center(
            child: Text(
              text,
              style: textStyle,
            ).setMarginOnly(bottom: 4.0),
          ),
        ),
      ),
    ));
  }
}
