import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:project_beta/components/forum/widgets/free_resource_mobile.dart';
import 'package:project_beta/components/forum/widgets/training_screen_mobile.dart';
import 'package:project_beta/components/learning_zone/widgets/learning_zone_tabbar.dart';
import 'package:project_beta/constants/app_assets.dart';
import 'package:project_beta/constants/app_routes.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/services/learning_zone/learning_zone_getx_controller.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class LearningZoneMobileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pampas,
      appBar: AppBar(
        toolbarHeight: 154.0,
        elevation: 0.0,
        backgroundColor: AppColor.pampas,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: AppColor.white),
          child: Column(
            children: [
              SizedBox(
                height: 88.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.keyboard_backspace,
                        color: AppColor.primaryColor,
                        size: 36.0,
                      ),
                    ),
                    Text(
                      LanguageConstants.learningZone.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontSize: 22.0),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, AppRoutes.learningSelectCategory),
                      child: SvgPicture.asset(
                        AppAssets.filter,
                        height: 24.0,
                        width: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
              LearningZoneTabBar(),
            ],
          ),
        ),
      ),
      body: GetBuilder<LearningZoneGetXController>(
        init: LearningZoneGetXController(),
        builder: (controller) {
          return controller.currentTab ==
                  LearningZoneCurrentTab.UpcomingTraining
              ? TrainingScreenMobile()
              : FreeResourceMobile();
        },
      ),
    );
  }
}
