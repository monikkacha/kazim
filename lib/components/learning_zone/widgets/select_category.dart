import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:project_beta/components/forum/widgets/filter_bottom_sheet.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/src/common_widgets/app_button.dart';
import 'package:project_beta/src/extensions/common_extension.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class LearningSelectCategoryScreen extends StatelessWidget {

  const LearningSelectCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  bottom: BorderSide(color: AppColor.desertStorm, width: 2.0))),
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
                      LanguageConstants.selectCategory.toUpperCase(),
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 22.0),
                    ),
                    InkWell(
                      onTap: () {
                        FilterBottomSheet.get(context);
                      },
                      child: Icon(
                        Icons.search,
                        color: AppColor.primaryColor,
                        size: 32.0,
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
          ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 28.h,
                  decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(4.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category 1",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: AppColor.nevada),
                      ),
                      Icon(
                        Icons.radio_button_unchecked,
                        color: AppColor.doveGrey,
                      )
                    ],
                  ),
                ).setMarginOnly(
                  top: 8.h,
                  left: 24.w,
                  right: 24.w,
                );
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: AppButton(
              height: 12.h,
              onTap: () {
                print("continue clicked");
              },
              borderRadius: BorderRadius.circular(2.0),
              label: LanguageConstants.kContinue.toUpperCase(),
              backgroundColor: AppColor.primaryColor,
              textStyle: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColor.white,
                  ),
            ),
          ).setMarginOnly(
            bottom: 12.h,
            left: 8.w,
            right: 8.w,
          )
        ],
      ),
    );
  }
}
