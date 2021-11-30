import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:project_beta/src/models/learning_zone_course_model.dart';
import 'package:project_beta/theme/app_theme.dart';

class CourseListCard extends StatelessWidget {
  final LearningZoneCourseModel learningZoneCourseModel;
  final VoidCallback onCourseSelected;

  CourseListCard(
      {required this.learningZoneCourseModel, required this.onCourseSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onCourseSelected,
        child: Ink(
            padding: EdgeInsets.only(top: 12.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.gallery,
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                            height: 150,
                            width: double.infinity,
                            child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.network(
                                    learningZoneCourseModel.thumbnail!))),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 4.0),
                            decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(4.0))),
                            child: Text(
                              learningZoneCourseModel.type!,
                              style: TextStyle(color: AppColor.white),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 12.0),
                      child: Row(
                        children: [
                          Container(
                              child: Column(
                                children: [
                                  Text(
                                    "22",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text("March",
                                      style: TextStyle(color: Colors.white))
                                ],
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: AppColor.primaryColor,
                              )),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(learningZoneCourseModel.title!),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(learningZoneCourseModel
                                            .trainingMode!),
                                        Text("5:00 PM - 6:00 PM"),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
