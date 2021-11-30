import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_beta/components/learning_zone/widgets/category_list_chip.dart';
import 'package:project_beta/services/learning_zone/learning_zone_getx_controller.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LearningZoneGetXController>(
        init: LearningZoneGetXController(),
        builder: (controller) {
          return Container(
            margin: EdgeInsets.only(left: 20.0),
            height: 30.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.categoryList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CategoryListChip(
                      categoryName: controller.categoryList[index],
                      activeCategoryName: controller.currentSelectedCategory,
                      onChipSelected: () => controller.currentSelectedCategory =
                          controller.categoryList[index],
                    ),
                  );
                }),
          );
        });
  }
}
