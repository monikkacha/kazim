import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_beta/components/forum/widgets/filter_bottom_sheet.dart';
import 'package:project_beta/constants/app_assets.dart';
import 'package:project_beta/constants/dummy_constant.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/services/learning_zone/learning_zone_getx_controller.dart';
import 'package:project_beta/src/common_widgets/app_button.dart';
import 'package:project_beta/src/extensions/common_extension.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class LearningZoneDetailMobile extends StatelessWidget {
  const LearningZoneDetailMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LearningZoneGetXController>(
      init: LearningZoneGetXController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.pampas,
          appBar: AppBar(
            toolbarHeight: 100.0,
            elevation: 0.0,
            backgroundColor: AppColor.pampas,
            centerTitle: true,
            leading: Container(),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: AppColor.desertStorm, width: 2.0))),
              child: Column(
                children: [
                  SizedBox(
                    height: 88.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.keyboard_backspace,
                            color: AppColor.primaryColor,
                            size: 36.0,
                          ),
                        ),
                        Text(
                          LanguageConstants.trainingDetails.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontSize: 22.0),
                        ),
                        InkWell(
                          onTap: () {
                            FilterBottomSheet.get(context);
                          },
                          child: Icon(
                            Icons.chat_outlined,
                            color: AppColor.primaryColor,
                            size: 28.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Stack(
            children: [
              Container(
                height: 300.h,
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(12.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Thumbnail Image
                    Container(
                      height: 80.h,
                      child: Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Container(
                                width: double.maxFinite,
                                height: 80.h,
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Image.network(
                                      DummyConstants.studyImg),
                                ),
                              )),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 20.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                  color: AppColor.black,
                                  borderRadius: BorderRadius.circular(6.0)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.0, vertical: 2.0),
                              child: Center(
                                child: Text(
                                  "02:45",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          color: AppColor.white,
                                          fontSize: 10.0),
                                ),
                              ),
                            ),
                          ).setMarginOnly(right: 8.0, bottom: 8.0),
                        ],
                      ),
                    ).setMarginOnly(top: 6.h, left: 14.w, right: 14.w),
                    // Video title and category
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Video title will come here...",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontSize: 17.0),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                "Category Name",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.fuelYellow),
                              ),
                            ],
                          ),
                          Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                color: AppColor.fuelYellow,
                                borderRadius: BorderRadius.circular(4.0)),
                            child: Center(
                              child: Text(
                                "\$20",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: AppColor.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).setMarginOnly(top: 6.h, left: 14.w, right: 14.w),
                    Divider(
                      color: AppColor.greenSpring,
                      height: 14.h,
                    ),
                    // Date & Time
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LanguageConstants.dateAndTime,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 15.0),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            "2 March 2021. 5:00 PM - 6:00 PM",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.greenSpring),
                          ),
                        ],
                      ),
                    ).setMarginOnly(left: 14.w, right: 14.w),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LanguageConstants.trainingMode,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontSize: 15.0),
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                LanguageConstants.online,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.greenSpring),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 7.0),
                            decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(4.0)),
                            child: Center(
                              child: Text(
                                LanguageConstants.viewInMap,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: AppColor.white, fontSize: 12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).setMarginOnly(top: 6.h, left: 14.w, right: 14.w),
                    Divider(
                      color: AppColor.greenSpring,
                      height: 14.h,
                    ),
                    Stack(
                      children: [
                        Container(
                          child: CircleAvatar(
                            radius: 22.0,
                            backgroundImage: AssetImage(AppAssets.person1),
                            backgroundColor: Colors.transparent,
                          ),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.white),
                              borderRadius: BorderRadius.circular(100.0)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 32.0),
                          child: CircleAvatar(
                            radius: 22.0,
                            backgroundImage: AssetImage(AppAssets.person2),
                            backgroundColor: Colors.transparent,
                          ),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.white),
                              borderRadius: BorderRadius.circular(100.0)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 2 * 32.0),
                          child: CircleAvatar(
                            radius: 22.0,
                            backgroundImage: AssetImage(AppAssets.person3),
                            backgroundColor: Colors.transparent,
                          ),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.white),
                              borderRadius: BorderRadius.circular(100.0)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 3 * 32.0),
                          child: CircleAvatar(
                            radius: 22.0,
                            backgroundImage: AssetImage(AppAssets.person4),
                            backgroundColor: Colors.transparent,
                          ),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.white),
                              borderRadius: BorderRadius.circular(100.0)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 4 * 32.0),
                          child: CircleAvatar(
                            radius: 22.0,
                            backgroundImage: AssetImage(AppAssets.person5),
                            backgroundColor: Colors.transparent,
                          ),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2.0, color: Colors.white),
                              borderRadius: BorderRadius.circular(100.0)),
                        ),
                        Container(
                          height: 46.0,
                          margin: EdgeInsets.only(left: 5 * 32.0),
                          child: Center(
                            child: Text(
                              "45+ coming here",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      color: AppColor.greenSpring,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                            ),
                          ),
                        ),
                      ],
                    ).setMarginOnly(left: 14.w, right: 14.w),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            LanguageConstants.aboutTraining,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 15.0),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            LanguageConstants.loremIpsum,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    fontSize: 14.0,
                                    color: AppColor.greenSpring),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.female,
                                height: 32.0,
                                width: 32.0,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                LanguageConstants.presenterName,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontSize: 15.0),
                              ),
                              Spacer(),
                              Text(
                                LanguageConstants.viewProfile,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        color: AppColor.fuelYellow,
                                        fontSize: 12.0),
                              ),
                            ],
                          )
                        ],
                      ),
                    ).setMarginOnly(left: 14.w, right: 14.w),
                  ],
                ),
              ).setMarginOnly(
                top: 6.h,
                left: 18.w,
                right: 18.w,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AppButton(
                  height: 12.h,
                  onTap: () {
                    print("aks for reschedule");
                  },
                  borderRadius: BorderRadius.circular(2.0),
                  label: LanguageConstants.askForReschedule.toUpperCase(),
                  backgroundColor: AppColor.primaryColor,
                  textStyle: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.white,
                      ),
                ),
              ).setMarginOnly(
                bottom: 12.h,
                left: 18.w,
                right: 18.w,
              )
            ],
          ),
        );
      },
    );
  }
}
