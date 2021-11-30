import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:project_beta/components/add_certification/add_certification.dart';
import 'package:project_beta/components/personal_detail/widgets/add_certificate.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/services/post/post_getx_controller.dart';
import 'package:project_beta/src/common_widgets/app_button.dart';
import 'package:project_beta/src/common_widgets/app_drop_down.dart';
import 'package:project_beta/src/common/app_text_form_field.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class PersonalDetailMobile extends StatelessWidget {
  const PersonalDetailMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                leading: Container(),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: ListTile(
                    title: Text(
                      LanguageConstants.personalDetails,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0,
                          color: AppColor.white),
                    ),
                    subtitle: Text(
                      LanguageConstants.letsGetYouUpAllDetails,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: AppColor.white,
                          wordSpacing: 2.0),
                    ),
                  ),
                ),
                expandedHeight: 70.h,
                // toolbarHeight: 32.h,
                floating: false,
                pinned: true,
                backgroundColor: AppColor.primaryColor,
              )
            ];
          },
          body: GetBuilder<PostGetXController>(
            init: PostGetXController(),
            builder: (controller) {
              return Container(
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0))),
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 16.h),
                        AppDropDownList(
                          labelTextStyle: TextStyle(
                              fontSize: 16.0,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                          height: 13.h,
                          title: LanguageConstants.highestQualification,
                          items: controller.categoryList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              onTap: () {
                                controller.selectedValue = value;
                              },
                              value: value,
                              child: Text(
                                value,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: AppColor.black,
                                    ),
                              ),
                            );
                          }).toList(),
                          value: controller.selectedValue,
                          onChanged: (String value) {},
                        ),
                        SizedBox(height: 8.h),
                        AppDropDownList(
                          labelTextStyle: TextStyle(
                              fontSize: 16.0,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                          height: 13.h,
                          title: LanguageConstants.currentDesignation,
                          items: controller.categoryList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              onTap: () {
                                controller.selectedValue = value;
                              },
                              value: value,
                              child: Text(
                                value,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: AppColor.black,
                                    ),
                              ),
                            );
                          }).toList(),
                          value: controller.selectedValue,
                          onChanged: (String value) {},
                        ),
                        SizedBox(height: 8.h),
                        AppDropDownList(
                          labelTextStyle: TextStyle(
                              fontSize: 16.0,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                          height: 13.h,
                          title: LanguageConstants.yearsOfExperience,
                          items: controller.categoryList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              onTap: () {
                                controller.selectedValue = value;
                              },
                              value: value,
                              child: Text(
                                value,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: AppColor.black,
                                    ),
                              ),
                            );
                          }).toList(),
                          value: controller.selectedValue,
                          onChanged: (String value) {},
                        ),
                        SizedBox(height: 8.h),
                        AddCertificate(
                            title: LanguageConstants.certifications,
                            hint: LanguageConstants.addCertification,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AddCertification.pageLink);
                            },
                            icon: Icons.add_circle),
                        SizedBox(height: 8.h),
                        AppTextFormField(
                          hintText: 'https://linkedin.com/in/abcde-efghi',
                          title: LanguageConstants.linkedInProfileLink,
                          borderColor: AppColor.black,
                          borderWidth: 1.0,
                          textStyle: TextStyle(
                              fontSize: 16.0,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.h),
                        AppDropDownList(
                          labelTextStyle: TextStyle(
                              fontSize: 16.0,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                          height: 13.h,
                          title: LanguageConstants.trailSessionOffered,
                          items: controller.categoryList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              onTap: () {
                                controller.selectedValue = value;
                              },
                              value: value,
                              child: Text(
                                value,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: AppColor.black,
                                    ),
                              ),
                            );
                          }).toList(),
                          value: controller.selectedValue,
                          onChanged: (String value) {},
                        ),
                        SizedBox(height: 8.h),
                        AppTextFormField(
                          hintText: '10',
                          title: LanguageConstants.duration,
                          borderColor: AppColor.black,
                          borderWidth: 1.0,
                          textStyle: TextStyle(
                              fontSize: 16.0,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.h),
                        AppDropDownList(
                          labelTextStyle: TextStyle(
                              fontSize: 16.0,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                          height: 13.h,
                          title: LanguageConstants.chargeBy,
                          items: controller.categoryList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              onTap: () {
                                controller.selectedValue = value;
                              },
                              value: value,
                              child: Text(
                                value,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: AppColor.black,
                                    ),
                              ),
                            );
                          }).toList(),
                          value: controller.selectedValue,
                          onChanged: (String value) {},
                        ),
                        SizedBox(height: 8.h),
                        AppTextFormField(
                          hintText: '500',
                          title: LanguageConstants.chargeRate,
                          borderColor: AppColor.black,
                          borderWidth: 1.0,
                          textStyle: TextStyle(
                              fontSize: 16.0,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.h),
                        AppButton(
                          label: LanguageConstants.kContinue.toUpperCase(),
                          onTap: () {},
                          backgroundColor: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(2.0),
                          height: 22.0,
                          textStyle: TextStyle(
                              color: AppColor.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.h),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
