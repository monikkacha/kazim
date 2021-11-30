import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_beta/constants/app_routes.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/src/common_widgets/app_text_form_field.dart';

import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';
import 'book_details_box.dart';

class BookBankBody extends StatelessWidget {
  const BookBankBody({Key? key}) : super(key: key);

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
                onTap: () => Beamer.of(context).beamToNamed(AppRoutes.bookDetails),
              ),
              SizedBox(height: 4.h),
              BookDetailsBox(
                onTap: () => Beamer.of(context).beamToNamed(AppRoutes.bookDetails),
              ),
              SizedBox(height: 4.h),
              BookDetailsBox(
                onTap: () => Beamer.of(context).beamToNamed(AppRoutes.bookDetails),
              ),
              SizedBox(height: 4.h),
              BookDetailsBox(
                onTap: () => Beamer.of(context).beamToNamed(AppRoutes.bookDetails),
              ),
              SizedBox(height: 4.h),
              BookDetailsBox(
                onTap: () => Beamer.of(context).beamToNamed(AppRoutes.bookDetails),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
