import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_beta/components/learning_zone/widgets/learning_zone_tab_item.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/services/learning_zone/learning_zone_getx_controller.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class LearningZoneTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LearningZoneGetXController>(
      init: LearningZoneGetXController(),
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(color: AppColor.white),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          height: 32.h,
          child: Row(
            children: [
              LearningZoneTabItem(
                  text: LanguageConstants.training,
                  onTabClick: () => controller.currentTab =
                      LearningZoneCurrentTab.UpcomingTraining,
                  defaultTab: LearningZoneCurrentTab.UpcomingTraining,
                  activeTab: controller.currentTab),
              SizedBox(
                width: 8.0,
              ),
              LearningZoneTabItem(
                  text: LanguageConstants.freeResources,
                  onTabClick: () => controller.currentTab =
                      LearningZoneCurrentTab.FreeResources,
                  defaultTab: LearningZoneCurrentTab.FreeResources,
                  activeTab: controller.currentTab),
            ],
          ),
        );
      },
    );
  }
}
