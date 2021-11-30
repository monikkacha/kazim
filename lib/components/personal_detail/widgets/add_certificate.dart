import 'package:flutter/material.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class AddCertificate extends StatelessWidget {
  String title;
  String hint;
  IconData icon;
  VoidCallback onTap;

  AddCertificate(
      {required this.title,
      required this.hint,
      required this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor),
        ),
        SizedBox(height: 1.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          height: 48.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: AppColor.black, width: 1.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                hint,
              ),
              GestureDetector(
                onTap: onTap,
                child: Icon(
                  icon,
                  color: AppColor.doveGrey.withAlpha(200),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
