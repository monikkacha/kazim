import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/services/forum/forum_filter_getx_controller.dart';
import 'package:project_beta/src/common_widgets/app_button.dart';
import 'package:project_beta/src/common_widgets/app_drop_down.dart';
import 'package:project_beta/src/common_widgets/common_app_bar.dart';
import 'package:project_beta/theme/app_theme.dart';
import 'package:project_beta/src/screen_utils.dart';

class ForumFilter extends StatelessWidget {
  static const pageLink = "/ForumFilter";

  final ForumFilterGetXController forumFilterGetXController =
      Get.put(ForumFilterGetXController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CommonAppBar.appBar(titleText: LanguageConstants.filter, actions: [
        Container(
          margin: EdgeInsets.only(right: 12.0),
          child: InkWell(
            onTap: () {
              // Get.offNamed(UserDiscussionForumScreen.pageLink);
            },
            child: Icon(
              Icons.highlight_remove,
              color: Colors.black,
              size: 32.0,
            ),
          ),
        )
      ]),
      body: GetBuilder<ForumFilterGetXController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: 16),
              child: Column(
                children: [
                  AppDropDownList(
                      title: LanguageConstants.subject,
                      value: controller.selectedListItem,
                      onChanged: (value) {
                        controller.getSelectedItem(value);
                      },
                      items: controller.list.map((String s) {
                        return DropdownMenuItem<String>(
                          value: s,
                          child: Text(
                            s,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: AppColor.primaryTextColor,
                                    ),
                          ),
                        );
                      }).toList()),
                  SizedBox(height: 8.h),
                  AppDropDownList(
                      title: LanguageConstants.classString,
                      value: controller.selectedListItem,
                      onChanged: (value) {
                        controller.getSelectedItem(value);
                      },
                      items: controller.list.map((String s) {
                        return DropdownMenuItem<String>(
                          value: s,
                          child: Text(
                            s,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: AppColor.primaryTextColor,
                                    ),
                          ),
                        );
                      }).toList()),
                  SizedBox(height: 8.h),
                  AppDropDownList(
                      title: LanguageConstants.bookType,
                      value: controller.selectedListItem,
                      onChanged: (value) {
                        controller.getSelectedItem(value);
                      },
                      items: controller.list.map((String s) {
                        return DropdownMenuItem<String>(
                          value: s,
                          child: Text(
                            s,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: AppColor.primaryTextColor,
                                    ),
                          ),
                        );
                      }).toList()),
                  SizedBox(height: 8.h),
                  AppDropDownList(
                      title: LanguageConstants.price,
                      value: controller.selectedListItem,
                      onChanged: (value) {
                        controller.getSelectedItem(value);
                      },
                      items: controller.list.map((String s) {
                        return DropdownMenuItem<String>(
                          value: s,
                          child: Text(
                            s,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: AppColor.primaryTextColor,
                                    ),
                          ),
                        );
                      }).toList()),
                  SizedBox(height: 8.h),
                  AppDropDownList(
                      title: LanguageConstants.bookCondition,
                      value: controller.selectedListItem,
                      onChanged: (value) {
                        controller.getSelectedItem(value);
                      },
                      items: controller.list.map((String s) {
                        return DropdownMenuItem<String>(
                          value: s,
                          child: Text(
                            s,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: AppColor.primaryTextColor,
                                    ),
                          ),
                        );
                      }).toList()),
                  SizedBox(height: 8.h),
                  AppDropDownList(
                      title: LanguageConstants.authorName,
                      value: controller.selectedListItem,
                      onChanged: (value) {
                        controller.getSelectedItem(value);
                      },
                      items: controller.list.map((String s) {
                        return DropdownMenuItem<String>(
                          value: s,
                          child: Text(
                            s,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: AppColor.primaryTextColor,
                                    ),
                          ),
                        );
                      }).toList()),
                  SizedBox(height: 8.h),
                  AppDropDownList(
                      title: LanguageConstants.book,
                      value: controller.selectedListItem,
                      onChanged: (value) {
                        controller.getSelectedItem(value);
                      },
                      items: controller.list.map((String s) {
                        return DropdownMenuItem<String>(
                          value: s,
                          child: Text(
                            s,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: AppColor.primaryTextColor,
                                    ),
                          ),
                        );
                      }).toList()),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      AppButton(
                        onTap: () {
                          print("cancel clicked");
                        },
                        label: LanguageConstants.cancel,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      AppButton(
                        onTap: () {
                          print("cancel clicked");
                        },
                        label: LanguageConstants.search,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
