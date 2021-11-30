import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_beta/components/learning_zone/widgets/category_item.dart';
import 'package:project_beta/components/learning_zone/widgets/course_card.dart';
import 'package:project_beta/constants/app_assets.dart';
import 'package:project_beta/constants/dummy_constant.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/services/learning_zone/training/training_getx_controller.dart';
import 'package:project_beta/src/extensions/common_extension.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class UpComingTrainingMobile extends StatelessWidget {
  const UpComingTrainingMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingGetXController>(
        init: TrainingGetXController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                categories(context: context, controller: controller),
                Container(
                  decoration: BoxDecoration(color: AppColor.gallery),
                  padding: EdgeInsets.symmetric(horizontal: 12.h),
                  child: ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.courseList.length,
                      itemBuilder: (context, index) {
                        return CourseCard();
                      }),
                ),
              ],
            ),
          );
        });
  }

  Widget categories({required context, required controller}) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      height: 56.h,
      child: Center(
        child: Container(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                width: 12.h,
              ),
              CategoryItem(
                label: LanguageConstants.audio,
                icon: AppAssets.sound,
                currentCatIndex: 0,
                activeCatIndex: controller.upcomingTrainingSelectedCategory,
                onCatSelected: (index) {
                  controller.upcomingTrainingSelectedCategory = index;
                },
              ),
              SizedBox(
                width: 8.h,
              ),
              CategoryItem(
                label: LanguageConstants.video,
                icon: AppAssets.videoPlayer,
                currentCatIndex: 1,
                activeCatIndex: controller.upcomingTrainingSelectedCategory,
                onCatSelected: (index) {
                  controller.upcomingTrainingSelectedCategory = index;
                },
              ),
              SizedBox(
                width: 8.h,
              ),
              CategoryItem(
                label: LanguageConstants.pdf,
                icon: AppAssets.pdf,
                currentCatIndex: 2,
                activeCatIndex: controller.upcomingTrainingSelectedCategory,
                onCatSelected: (index) {
                  controller.upcomingTrainingSelectedCategory = index;
                },
              ),
              SizedBox(
                width: 8.h,
              ),
              CategoryItem(
                label: LanguageConstants.text,
                icon: AppAssets.notes,
                currentCatIndex: 3,
                activeCatIndex: controller.upcomingTrainingSelectedCategory,
                onCatSelected: (index) {
                  controller.upcomingTrainingSelectedCategory = index;
                },
              ),
              SizedBox(
                width: 8.h,
              ),
              CategoryItem(
                label: LanguageConstants.other,
                icon: AppAssets.moreOptions,
                currentCatIndex: 4,
                activeCatIndex: controller.upcomingTrainingSelectedCategory,
                onCatSelected: (index) {
                  controller.upcomingTrainingSelectedCategory = index;
                },
              ),
              SizedBox(
                width: 8.h,
              ),
            ],
          ),
        ).setMarginOnly(
          top: 5.h,
          bottom: 5.h,
        ),
      ),
    );
  }
}
