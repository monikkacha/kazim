import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_beta/components/profile/widgets/education_tab.dart';
import 'package:project_beta/components/profile/widgets/personal_tab.dart';
import 'package:project_beta/components/profile/widgets/personality_tab.dart';

class ProfileGetXController extends GetxController
    with SingleGetTickerProviderMixin {
  final List<Widget> screens = [
    PersonalWidget(),
    EducationalWidget(),
    PersonalityWidget(),
  ].obs;

  var index = 0.obs;

  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: screens.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  animateController(int index) {
    tabController.animateTo(
      index,
      duration: Duration(seconds: 2),
      curve: Curves.easeInOutSine,
    );
    update();
  }
}
