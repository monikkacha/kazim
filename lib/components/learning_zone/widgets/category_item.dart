import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class CategoryItem extends StatelessWidget {
  String icon;
  String label;
  int activeCatIndex;
  int currentCatIndex;
  Function onCatSelected;

  CategoryItem(
      {required this.icon,
      required this.label,
      required this.activeCatIndex,
      required this.onCatSelected,
      required this.currentCatIndex});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = activeCatIndex == currentCatIndex
        ? AppColor.primaryColor
        : AppColor.white;

    Color borderColor = activeCatIndex == currentCatIndex
        ? AppColor.fuelYellow
        : AppColor.doveGrey.withAlpha(50);

    return Column(
      children: [
        GestureDetector(
          onTap: () => onCatSelected(
              activeCatIndex == currentCatIndex ? -1 : currentCatIndex),
          child: Container(
            height: 32.h,
            width: 32.h,
            decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(width: 1.0, color: borderColor),
                borderRadius: BorderRadius.circular(100.0)),
            child: Center(
              child: SvgPicture.asset(
                icon,
                height: 14.h,
                width: 14.h,
              ),
            ),
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.headline6!.copyWith(
              color: AppColor.black,
              fontWeight: FontWeight.bold,
              fontSize: 14.0),
        ),
      ],
    );
  }
}
