import 'package:get/get.dart';
import 'package:project_beta/constants/app_assets.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/src/models/category_model.dart';

class MoreScreenGetXController extends GetxController {
  List<CategoryModel> moreCategory = [
    CategoryModel(
        title: LanguageConstants.healthWellness, asset: AppAssets.healthCare),
    CategoryModel(
      title: LanguageConstants.personalProgress,
      asset: AppAssets.personal,
    ),
    CategoryModel(
      title: LanguageConstants.counselingSpace,
      asset: AppAssets.counseling,
    ),
    CategoryModel(
      title: LanguageConstants.timeManagement,
      asset: AppAssets.timer,
    ),
    CategoryModel(
      title: LanguageConstants.tutorZone,
      asset: AppAssets.tutorZone,
    ),
    CategoryModel(
      title: LanguageConstants.mentorZone,
      asset: AppAssets.mentorZone,
    ),
    CategoryModel(
      title: LanguageConstants.learningZone,
      asset: AppAssets.learningZone,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
  }
}
