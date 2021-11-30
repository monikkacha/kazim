import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class AppCloseButton extends StatelessWidget {
  const AppCloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              24.w,
            ),
          ),
        ),
        child: Icon(
          Icons.close,
          size: 22.w,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}
