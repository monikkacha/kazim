import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_beta/constants/app_assets.dart';
import 'package:project_beta/constants/app_routes.dart';
import 'package:project_beta/constants/dummy_constant.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/src/extensions/common_extension.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class CourseCard extends StatelessWidget {

  const CourseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoutes.learningZoneDetail),
      child: Container(
        margin: EdgeInsets.only(top: 8.h),
        decoration: BoxDecoration(
            color: AppColor.white, borderRadius: BorderRadius.circular(8.0)),
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80.h,
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        height: 80.h,
                        width: double.maxFinite,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.network(DummyConstants.studyImg),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                      child: Center(
                        child: Text(
                          "02:45",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: AppColor.white, fontSize: 10.0),
                        ),
                      ),
                    ),
                  ).setMarginOnly(right: 8.0, bottom: 8.0),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 48.0,
                      width: 48.0,
                      decoration: BoxDecoration(
                          color: AppColor.fuelYellow,
                          borderRadius: BorderRadius.circular(6.0)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "22",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontSize: 18.0, color: AppColor.white),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              "MARCH",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontSize: 11.0, color: AppColor.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).setMarginOnly(left: 8.0, top: 8.0),
                  /// CHANGE ASSET TO PLAY BUTTON
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      AppAssets.mentor,
                      fit: BoxFit.contain,
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            ),
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
                            .copyWith(fontSize: 14.0),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppAssets.wifi,
                            height: 10.0,
                            width: 10.0,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            LanguageConstants.online,
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.greenSpring),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            width: 16.0,
                            height: 16.0,
                            child: Center(
                              child: SvgPicture.asset(
                                AppAssets.clock,
                                height: 12.0,
                                width: 12.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "5:00 PM - 6:00 PM",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.greenSpring),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 7.0),
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(4.0)),
                    child: Center(
                      child: Text(
                        LanguageConstants.bookNow,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: AppColor.white, fontSize: 12.0),
                      ),
                    ),
                  ),
                ],
              ),
            ).setMarginOnly(
              top: 6.h,
            ),
          ],
        ),
      ),
    );
  }

}
