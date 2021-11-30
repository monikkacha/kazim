import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_beta/components/login_and_registration/login/widgets/email_login_tab.dart';
import 'package:project_beta/components/login_and_registration/login/widgets/mobile_login_tab.dart';

class LoginTabsGetXController extends GetxController
    with SingleGetTickerProviderMixin {
  List<Widget> screens = [
    EmailScreen(),
    MobileScreen(),
  ].obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var checkValue = false.obs;
  late int index;

  late TabController tabController;

  late int length;
  late int webTabLength;

  @override
  void onInit() {
    length = screens.length;
    tabController = TabController(length: length, vsync: this);

    screens.map((element) {
      index = screens.indexOf(element);
    }).toList();

    update();
    super.onInit();
  }

  onCheckBoxClicked(bool value) {
    checkValue.value = value;
    print(value);
    update();
  }
}
