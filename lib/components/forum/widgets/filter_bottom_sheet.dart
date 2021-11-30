import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/services/forum/forum_filter_getx_controller.dart';
import 'package:project_beta/src/common_widgets/app_button.dart';
import 'package:project_beta/src/common_widgets/app_drop_down.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class FilterBottomSheet {
  static get(context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return GetBuilder<ForumFilterGetXController>(
              init: ForumFilterGetXController(),
              builder: (controller) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            LanguageConstants.filter,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryColor,
                                fontSize: 20.0),
                          ),
                          InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Icon(Icons.close))
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      AppDropDownList(
                        labelTextStyle: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                        height: 13.h,
                        title: 'First Filter',
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
                      SizedBox(
                        height: 8.h,
                      ),
                      AppDropDownList(
                        labelTextStyle: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                        height: 13.h,
                        title: 'Second Filter',
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
                      SizedBox(
                        height: 8.h,
                      ),
                      AppDropDownList(
                        labelTextStyle: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                        height: 13.h,
                        title: 'Third Filter',
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
                      SizedBox(
                        height: 16.h,
                      ),
                      AppButton(
                        onTap: () {
                          print(" Apply now button clicked");
                        },
                        backgroundColor: AppColor.primaryColor,
                        label: LanguageConstants.apply,
                        textColor: AppColor.white,
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
