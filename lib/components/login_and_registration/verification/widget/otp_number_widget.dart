
import 'package:flutter/material.dart';
import 'package:project_beta/src/extensions/common_extension.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/theme/app_theme.dart';

class OtpNumberWidget extends StatelessWidget {
  final double? width;

  const OtpNumberWidget({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OTPWidget(otpNumber: '1'),
        ),
        SizedBox(
          width: width
        ),
        Expanded(
          child: OTPWidget(otpNumber: '2'),
        ),
        SizedBox(
          width: width
        ),
        Expanded(
          child: OTPWidget(otpNumber: '3'),
        ),
        SizedBox(
          width: width
        ),
        Expanded(
          child: OTPWidget(otpNumber: '4'),
        ),
      ],
    ).setMarginSymmetric(
      horizontal: 32.w,
    );
  }
}

class OTPWidget extends StatelessWidget {
  final String? otpNumber;

  const OTPWidget({Key? key, this.otpNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      width: 32.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColor.primaryColor,
      ),
      child: Text(
        otpNumber!,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: AppColor.backgroundColor,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
