import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:project_beta/components/add_certification/widgets/add_image.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/services/post/post_getx_controller.dart';
import 'package:project_beta/src/common_widgets/app_button.dart';
import 'package:project_beta/src/common_widgets/app_drop_down.dart';
import 'package:project_beta/src/common_widgets/share_bottom_sheet.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class AddCertificationMobile extends StatelessWidget {
  const AddCertificationMobile({Key? key}) : super(key: key);

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
                flexibleSpace: Container(
                  height: 60.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          LanguageConstants.addCertification,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0,
                              color: AppColor.white),
                        ),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 42.0,
                            width: 42.0,
                            child: Center(
                              child: Icon(
                                Icons.cancel,
                                size: 34.0,
                                color: AppColor.fuelYellow,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                toolbarHeight: 50.h,
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
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        SizedBox(height: 16.h),
                        AppDropDownList(
                          labelTextStyle: TextStyle(
                              fontSize: 16.0,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                          height: 13.h,
                          title: LanguageConstants.name,
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
                          title: LanguageConstants.organization,
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
                          title: LanguageConstants.expiration,
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
                        Text(
                          LanguageConstants.addImage,
                          style: TextStyle(
                              fontSize: 16.0,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4.h),
                        AddImage(),
                        SizedBox(height: 8.h),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: AppButton(
                          label: LanguageConstants.save.toUpperCase(),
                          onTap: () => ShareBottomSheet.get(context),
                          backgroundColor: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(2.0),
                          height: 24.0,
                          textStyle: TextStyle(
                              color: AppColor.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
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
