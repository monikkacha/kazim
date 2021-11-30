import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_beta/components/book_bank/widgets/book_details_box.dart';
import 'package:project_beta/constants/app_routes.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/src/common_widgets/app_text_form_field.dart';
import 'package:project_beta/src/extensions/common_extension.dart';

import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class BookBankWeb extends StatelessWidget {
  const BookBankWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          prefixIcon: Icon(
            Icons.search,
            size: 24.w,
            color: AppColor.primaryColor,
          ),
          hintText: LanguageConstants.searchHere,
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              BookDetailsBox(
                onTap: () => Get.toNamed(AppRoutes.bookDetails),
              ),
              SizedBox(height: 4.h),
              BookDetailsBox(
                onTap: () => Get.toNamed(AppRoutes.bookDetails),
              ),
              SizedBox(height: 4.h),
              BookDetailsBox(
                onTap: () => Get.toNamed(AppRoutes.bookDetails),
              ),
              SizedBox(height: 4.h),
              BookDetailsBox(
                onTap: () => Get.toNamed(AppRoutes.bookDetails),
              ),
              SizedBox(height: 4.h),
              BookDetailsBox(
                onTap: () => Get.toNamed(AppRoutes.bookDetails),
              ),
            ],
          ),
        ),
      ],
    ).setMarginSymmetric(
      horizontal: 24.w,
      vertical: 2.h,
    );
  }
}
