import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/services/learning_zone/training/training_getx_controller.dart';
import 'package:project_beta/src/extensions/common_extension.dart';
import 'package:project_beta/src/extensions/responsive.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class TrainingScreenMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingGetXController>(
        init: TrainingGetXController(),
        builder: (controller) {
          return SizedBox(
            height: double.maxFinite,
            child: Column(
              children: [
                tabBar(context: context, controller: controller),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: controller.screens,
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget tabBar({required context, required controller}) {
    return Container(
      decoration: BoxDecoration(color: AppColor.white),
      child: DefaultTabController(
        length: controller.length,
        initialIndex: controller.index,
        child: TabBar(
          controller: controller.tabController,
          labelColor: AppColor.primaryColor,
          indicatorColor: AppColor.fuelYellow,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 1.0,
          labelStyle: Theme.of(context).textTheme.headline6!.copyWith(
                color: AppColor.primaryColor,
              ),
          unselectedLabelStyle: Theme.of(context).textTheme.headline6,
          unselectedLabelColor: AppColor.darkBackgroundColor.withOpacity(0.5),
          labelPadding: EdgeInsets.symmetric(
            vertical: 6.h,
          ),
          tabs: [
            Text(
              LanguageConstants.upcomingTraining,
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              LanguageConstants.pastTraining,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ).setMarginSymmetric(
          horizontal: 12.w,
        ),
      ),
    );
  }
}
