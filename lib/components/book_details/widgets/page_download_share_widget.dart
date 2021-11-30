import 'package:flutter/material.dart';
import 'package:project_beta/constants/app_assets.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/src/common_widgets/circular_icon_container.dart';
import 'package:project_beta/src/extensions/common_extension.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/src/template/material_template.dart';
import 'package:project_beta/theme/app_theme.dart';

class PageDownloadShareWidget extends StatelessWidget {
  const PageDownloadShareWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardTemplate(
      elevation: 1.5,
      backgroundColor: AppColor.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CircularIconContainer(
                padding: 8,
                avatar: AppAssets.book,
                iconBackgroundColor: AppColor.primaryColor.withOpacity(0.1),
                height: 20.h,
              ),
              SizedBox(height: 2.h),
              Text(
                '50 Page',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
          Column(
            children: [
              CircularIconContainer(
                padding: 8,
                avatar: AppAssets.folder,
                iconBackgroundColor: AppColor.primaryColor.withOpacity(0.1),
                height: 20.h,
              ),
              SizedBox(height: 2.h),
              Text(
                '10k Downloads',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
          Column(
            children: [
              CircularIconContainer(
                padding: 8,
                avatar: AppAssets.share,
                iconBackgroundColor: AppColor.primaryColor.withOpacity(0.1),
                height: 20.h,
              ),
              SizedBox(height: 2.h),
              Text(
                LanguageConstants.share,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ],
      ).setMarginSymmetric(
        horizontal: 16.w,
        vertical: 4.h,
      ),
    ).setMarginOnly(
      bottom: 4.h,
    );
  }
}
