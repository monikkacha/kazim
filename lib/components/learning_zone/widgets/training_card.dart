import 'package:flutter/cupertino.dart';
import 'package:project_beta/src/models/learning_zone_course_model.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class TrainingCard extends StatelessWidget {
  late final LearningZoneCourseModel learningZoneCourseModel;
  VoidCallback onCardTap;

  TrainingCard(
      {required this.learningZoneCourseModel, required this.onCardTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      decoration: BoxDecoration(
          color: AppColor.white, borderRadius: BorderRadius.circular(8.0)),
      padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 4.h),
      child: Column(
        children: [
          Text(learningZoneCourseModel.title!),
        ],
      ),
    );
  }
}
