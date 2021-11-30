import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_beta/constants/app_assets.dart';
import 'package:project_beta/constants/app_routes.dart';
import 'package:project_beta/src/models/login_as_model.dart';

class LoginAsGetXController extends GetxController {
  var selectedIndex = 0.obs;
  List<LoginAsModel> loginAsList = [
    LoginAsModel(title: 'Students', avatar: AppAssets.student),
    LoginAsModel(title: 'Parents', avatar: AppAssets.parent),
    LoginAsModel(title: 'Mentor', avatar: AppAssets.mentor),
    LoginAsModel(title: 'Tutor', avatar: AppAssets.tutor),
    LoginAsModel(title: 'Counselor', avatar: AppAssets.counselor),
    LoginAsModel(title: 'Dietitan', avatar: AppAssets.dietitian),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  setIndex(int index) {
    selectedIndex.value = index;
    update();
  }

  navigateToScreens(int index, BuildContext context) {
    if (index == 0) {
      Beamer.of(context).beamToNamed(AppRoutes.login);
    } else if (index == 1) {
      Beamer.of(context).beamToNamed(AppRoutes.createAccount);
    } else if (index == 2) {
      Beamer.of(context).beamToNamed(AppRoutes.forgotPassword);
    } else if (index == 3) {
      Beamer.of(context).beamToNamed(AppRoutes.profile);
    } else if (index == 4) {
      Beamer.of(context).beamToNamed(AppRoutes.createNewPassword);
    } else if (index == 5) {
      Beamer.of(context).beamToNamed(AppRoutes.home);
    }
  }
}
