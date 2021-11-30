import 'package:flutter/material.dart';
import 'package:project_beta/components/login_and_registration/sign_up_as/web/sign_up_as_web.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/src/template/app_bar_template.dart';
import 'package:project_beta/src/template/desktop_wrapper.dart';
import 'package:project_beta/src/template/responsive.dart';
import 'package:project_beta/theme/app_theme.dart';

import 'widgets/sign_up_as_body.dart';

class SignUpAsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: SliverAppBarTemplate(
        body: SignUpAsBody(),
        backgroundColor: AppColor.primaryColor,
        title: LanguageConstants.signUpAs,
        fontSize: 18.sp,
        expandedHeight: 56.h,
        bottomHeight: 4.h,
      ),
      tablet: SliverAppBarTemplate(
        body: SignUpAsBody(),
        backgroundColor: AppColor.primaryColor,
        title: LanguageConstants.signUpAs,
        fontSize: 18.sp,
        expandedHeight: 60.h,
      ),
      desktop: DesktopWrapper(
        child: SignUpAsWeb(),
      ),
    );
  }
}
