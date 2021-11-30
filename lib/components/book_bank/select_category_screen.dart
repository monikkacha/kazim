
import 'package:flutter/material.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/src/template/app_bar_template.dart';
import 'package:project_beta/src/template/responsive.dart';
import 'package:project_beta/theme/app_theme.dart';

import 'web/select_category_web.dart';
import 'widgets/select_category_body.dart';

class SelectCategoryScreen extends StatelessWidget {
  const SelectCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: AppBarTemplate(
        title: LanguageConstants.selectCategory,
        backGroundColor: AppColor.lightYellow,
        isDrawer: false,
        suffixWidget: Container(),
        toolbarHeight: 16.h,
        body: SelectCategoryBody(),
      ),
      tablet: AppBarTemplate(
        title: LanguageConstants.selectCategory,
        backGroundColor: AppColor.lightYellow,
        isDrawer: false,
        suffixWidget: Container(),
        toolbarHeight: 18.h,
        body: SelectCategoryBody(),
      ),
      desktop: AppBarTemplate(
        title: LanguageConstants.selectCategory,
        backGroundColor: AppColor.lightYellow,
        isDrawer: false,
        suffixWidget: Container(),
        toolbarHeight: 18.h,
        body: SelectCategoryWeb(),
      ),
    );
  }
}
