import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_beta/components/book_bank/widgets/book_details_body.dart';
import 'package:project_beta/constants/app_assets.dart';
import 'package:project_beta/constants/app_routes.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/src/extensions/common_extension.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/src/template/app_bar_template.dart';
import 'package:project_beta/src/template/responsive.dart';
import 'package:project_beta/theme/app_theme.dart';

import 'web/book_details_web.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: AppBarTemplate(
        elevation: 0.5,
        backGroundColor: AppColor.lightYellow,
        title: LanguageConstants.bookDetails,
        toolbarHeight: 16.h,
        suffixWidget: GestureDetector(
          onTap: () => Beamer.of(context).beamToNamed(AppRoutes.bookBankFilter),
          child: SvgPicture.asset(
            AppAssets.chat,
            color: AppColor.primaryColor,
          ).setMarginOnly(
            right: 24.w,
          ),
        ),
        body: BookDetailsBody().setMarginSymmetric(
          horizontal: 24.w,
          vertical: 12.h,
        ),
      ),
      tablet: AppBarTemplate(
        elevation: 0.5,
        backGroundColor: AppColor.lightYellow,
        title: LanguageConstants.bookDetails,
        toolbarHeight: 16.h,
        suffixWidget: GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.bookBankFilter),
          child: SvgPicture.asset(
            AppAssets.chat,
            color: AppColor.primaryColor,
          ).setMarginOnly(
            right: 24.w,
          ),
        ),
        body: BookDetailsBody().setMarginSymmetric(
          horizontal: 32.w,
          vertical: 12.h,
        ),
      ),
      desktop: AppBarTemplate(
        elevation: 0.5,
        backGroundColor: AppColor.lightYellow,
        title: LanguageConstants.bookDetails,
        toolbarHeight: 16.h,
        suffixWidget: GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.bookBankFilter),
          child: SvgPicture.asset(
            AppAssets.chat,
            color: AppColor.primaryColor,
          ).setMarginOnly(
            right: 24.w,
          ),
        ),
        body: BookDetailsWeb().setMarginSymmetric(
          horizontal: 80.w,
          vertical: 12.h,
        ),
      ),
    );
  }
}
