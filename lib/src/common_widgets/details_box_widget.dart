
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/src/template/responsive.dart';
import 'package:project_beta/theme/app_theme.dart';

class DetailsBox extends StatelessWidget {
  final String avatarUrl;
  final String title;
  final Function? onTap;

  const DetailsBox(
      {Key? key, required this.avatarUrl, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: Responsive.isMobile(context)
              ? 6.h
              : Responsive.isTablet(context)
                  ? 6.h
                  : 8.h,
        ),
        height: Responsive.isMobile(context) ? 88.h : 72.h,
        width: Responsive.isMobile(context) ? 44.w : 64.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.darkBackgroundColor.withOpacity(0.05),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              16.w,
            ),
          ),
          color: AppColor.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: AppColor.darkBackgroundColor.withOpacity(0.08),
              blurRadius: 25.0, // soften the shadow
              spreadRadius: 5.0, //extend the shadow
              offset: Offset(
                15.0, // Move to right 10  horizontally
                15.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius:
                  Responsive.isMobile(context) || Responsive.isTablet(context)
                      ? 36.w
                      : 40.w,
              backgroundColor: AppColor.primaryColor.withOpacity(0.1),
              child: SvgPicture.asset(
                avatarUrl,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
