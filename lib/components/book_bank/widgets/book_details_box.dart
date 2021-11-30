import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_beta/constants/app_assets.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/src/extensions/common_extension.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class BookDetailsBox extends StatelessWidget {
  final Function? onTap;

  BookDetailsBox({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Card(
        elevation: 1.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Container(
          child: Row(
            children: [
              Container(
                height: 60.h,
                width: 104.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.w),
                  color: Colors.indigo,
                ),
                child: SvgPicture.asset(
                  AppAssets.scientist,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          LanguageConstants.category,
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    color: AppColor.secondaryColor,
                                  ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColor.secondaryColor,
                            ),
                            Icon(
                              Icons.star,
                              color: AppColor.secondaryColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Book Name',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      LanguageConstants.general,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: AppColor.secondaryTextColor.withOpacity(0.5),
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Author Name',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
            ],
          ).setMarginAll(value: 12.w),
        ),
      ),
    );
  }
}
