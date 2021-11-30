import 'package:flutter/material.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class AppTextButton1 extends StatelessWidget {
  final Function onTap;
  final String text1;
  final String text2;

  const AppTextButton1({
    required this.onTap,
    this.text1: '',
    this.text2: '',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          text1,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
            color: AppColor.darkBorderColor.withOpacity(0.4),
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: () => onTap(),
          child: Text(
            text2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class AppTextButton2 extends StatelessWidget {
  final String? label;
  final Function? onTap;
  final Color fontColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  const AppTextButton2({
    this.label,
    this.onTap,
    this.fontColor: AppColor.primaryColor,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Text(
        label!,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: fontColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
      ),
    );
  }
}
