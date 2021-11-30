
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_beta/src/extensions/common_extension.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class AvatarInfo extends StatelessWidget {
  final String avatar;
  final String title;
  final double? avatarHeight;
  final double? height;
  final double? width;
  final Color? textColor;
  final Color? backGroundColor;
  final bool? selected;
  final Function? onTap;
  final double? listTileSpacing;
  final Color avatarBackgroundColor;
  final EdgeInsetsGeometry? padding;

  AvatarInfo({
    required this.avatar,
    required this.title,
    this.selected,
    this.onTap,
    this.avatarHeight,
    this.textColor: AppColor.primaryColor,
    this.backGroundColor: AppColor.primaryColor,
    this.avatarBackgroundColor: AppColor.primaryColor,
    this.height,
    this.width,
    this.padding,
    this.listTileSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        padding: padding,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              24.w,
            ),
          ),
          color: backGroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1.w,
              blurRadius: 2,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          title: Container(
            padding: EdgeInsets.only(top: 8.h),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: avatarBackgroundColor,
            ),
            child: SvgPicture.asset(
              avatar,
              fit: BoxFit.contain,
              height: avatarHeight!,
            ),
          ).setMarginOnly(
            bottom: 2.h,
          ),
          subtitle: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: textColor,
                ),
          ),
        ).setMarginOnly(
          bottom: listTileSpacing!,
        ),
      ),
    );
  }
}
