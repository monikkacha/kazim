import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_beta/components/learning_zone_detail/learning_zone_detail.dart';
import 'package:project_beta/components/learning_zone/widgets/course_list_card.dart';
import 'package:project_beta/services/learning_zone/learning_zone_getx_controller.dart';

class CourseList extends StatelessWidget {
  const CourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LearningZoneGetXController>(
        init: LearningZoneGetXController(),
        builder: (controller) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: EdgeInsets.only(bottom: 24.0),
              child: ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.courseList.length,
                  itemBuilder: (_, index) {
                    return CourseListCard(
                      learningZoneCourseModel: controller.courseList[index],
                      onCourseSelected: () {
                        controller.selectedCourse = index;
                        Navigator.pushNamed(
                            context, LearningZoneDetailScreen.pageLink);
                      },
                    );
                  }),
            ),
          );
        });
  }
}
