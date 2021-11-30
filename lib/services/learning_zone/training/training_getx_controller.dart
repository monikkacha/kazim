import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_beta/components/learning_zone/widgets/past_training_mobile.dart';
import 'package:project_beta/components/learning_zone/widgets/upcoming_training_mobile.dart';
import 'package:project_beta/constants/dummy_constant.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/src/models/learning_zone_course_model.dart';

class TrainingGetXController extends GetxController
    with SingleGetTickerProviderMixin {
  List<Widget> screens =
      [UpComingTrainingMobile(), UpComingTrainingMobile()].obs;

  int _upcomingTrainingSelectedCategory = -1.obs;

  late int index;

  late TabController tabController;

  late int length;

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

  var _courseList = [
    LearningZoneCourseModel(
        title: "Flutter Course 1",
        category: LanguageConstants.business,
        dateAndTime: "",
        information: LanguageConstants.loremIpsum,
        presenter: "Flutter Developer",
        thumbnail: DummyConstants.flutterCourseThumbnail,
        trainingMode: LanguageConstants.online,
        type: LanguageConstants.free),
    LearningZoneCourseModel(
        title: "Flutter Course 2",
        category: LanguageConstants.technology,
        dateAndTime: "",
        information: LanguageConstants.loremIpsum,
        presenter: "Flutter Developer",
        thumbnail: DummyConstants.flutterCourseThumbnail,
        trainingMode: LanguageConstants.online,
        type: LanguageConstants.free),
    LearningZoneCourseModel(
        title: "Flutter Course 3",
        category: LanguageConstants.technology,
        dateAndTime: "",
        information: LanguageConstants.loremIpsum,
        presenter: "Flutter Developer",
        thumbnail: DummyConstants.flutterCourseThumbnail,
        trainingMode: LanguageConstants.online,
        type: LanguageConstants.free),
    LearningZoneCourseModel(
        title: "Flutter Course 4",
        category: LanguageConstants.politics,
        dateAndTime: "",
        information: LanguageConstants.loremIpsum,
        presenter: "Flutter Developer",
        thumbnail: DummyConstants.flutterCourseThumbnail,
        trainingMode: LanguageConstants.online,
        type: LanguageConstants.free),
    LearningZoneCourseModel(
        title: "Flutter Course 5",
        category: LanguageConstants.stockMarket,
        dateAndTime: "",
        information: LanguageConstants.loremIpsum,
        presenter: "Flutter Developer",
        thumbnail: DummyConstants.flutterCourseThumbnail,
        trainingMode: LanguageConstants.online,
        type: LanguageConstants.free),
    LearningZoneCourseModel(
        title: "Flutter Course 6",
        category: LanguageConstants.innovation,
        dateAndTime: "",
        information: LanguageConstants.loremIpsum,
        presenter: "Flutter Developer",
        thumbnail: DummyConstants.flutterCourseThumbnail,
        trainingMode: LanguageConstants.online,
        type: LanguageConstants.free),
    LearningZoneCourseModel(
        title: "Flutter Course 7",
        category: LanguageConstants.innovation,
        dateAndTime: "",
        information: LanguageConstants.loremIpsum,
        presenter: "Flutter Developer",
        thumbnail: DummyConstants.flutterCourseThumbnail,
        trainingMode: LanguageConstants.online,
        type: LanguageConstants.free),
  ].obs;

  get courseList => _courseList;

  set courseList(value) {
    _courseList = value;
  }

  int get upcomingTrainingSelectedCategory => _upcomingTrainingSelectedCategory;

  set upcomingTrainingSelectedCategory(int value) {
    _upcomingTrainingSelectedCategory = value;
    update();
  }
}
