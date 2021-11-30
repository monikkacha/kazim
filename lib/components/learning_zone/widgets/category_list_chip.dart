import 'package:flutter/material.dart';
import 'package:project_beta/theme/app_theme.dart';

class CategoryListChip extends StatelessWidget {
  final String categoryName;
  final String activeCategoryName;
  final VoidCallback onChipSelected;

  CategoryListChip(
      {required this.categoryName,
      required this.activeCategoryName,
      required this.onChipSelected});

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration = BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: AppColor.primaryColor, width: 1.4));
    TextStyle style =
        TextStyle(fontWeight: FontWeight.w300, color: AppColor.primaryColor);

    if (categoryName == activeCategoryName) {
      decoration = BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(color: AppColor.primaryColor, width: 1.4));
      style = TextStyle(fontWeight: FontWeight.w300, color: AppColor.white);
    }

    return InkWell(
      onTap: onChipSelected,
      child: Ink(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: decoration,
        child: Center(
          child: Text(
            categoryName,
            style: style,
          ),
        ),
      ),
    );
  }
}
