import 'package:flutter/material.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/services/create_account/create_account_getx_controller.dart';
import 'package:get/get.dart';
import 'package:project_beta/components/login_and_registration/login/widgets/phone_number_widget.dart';
import 'package:project_beta/constants/app_icons.dart';
import 'package:project_beta/src/common_widgets/app_button.dart';
import 'package:project_beta/src/common_widgets/app_drop_down.dart';
import 'package:project_beta/src/common_widgets/app_list_tyle.dart';
import 'package:project_beta/src/common_widgets/app_text_button.dart';
import 'package:project_beta/src/common_widgets/app_text_form_field.dart';
import 'package:project_beta/src/common_widgets/password_widget.dart';
import 'package:project_beta/src/extensions/common_extension.dart';
import 'package:project_beta/src/models/gender_model.dart';
import 'package:project_beta/src/screen_utils.dart';
import 'package:project_beta/src/template/responsive.dart';
import 'package:project_beta/theme/app_theme.dart';

class CreateAccountWeb extends StatelessWidget {
  final CreateAccountGetXController getXController =
      Get.put(CreateAccountGetXController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAccountGetXController>(
      builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              AppListTile(
                title: LanguageConstants.createAccount,
                titleTextStyle: Theme.of(context).textTheme.headline5!.copyWith(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                subTitle: LanguageConstants.letsGetYouUpAllDetails,
                subTitleTextStyle:
                    Theme.of(context).textTheme.headline6!.copyWith(
                          color: AppColor.primaryColor,
                        ),
              ).setMarginOnly(
                bottom: 24.h,
              ),
              AppTextFormField(
                hintText: LanguageConstants.firstName,
                title: LanguageConstants.firstName,
                prefixIcon: Icon(
                  AppIcons.person,
                  size: 22.w,
                  color: AppColor.primaryColor,
                ),
                titleSpacing: 2,
                controller: controller.firstNameController,
                onChanged: (value) {},
              ),
              SizedBox(height: 4.h),
              AppTextFormField(
                hintText: LanguageConstants.lastName,
                title: LanguageConstants.lastName,
                titleSpacing: 2,
                prefixIcon: Icon(
                  AppIcons.person,
                  size: 22.w,
                  color: AppColor.primaryColor,
                ),
                controller: controller.lastNameController,
                onChanged: (value) {},
              ),
              SizedBox(height: 4.h),
              PhoneNumberWidget(
                onChanged: (value) {},
                initialSelection: '+91',
                controller: controller.mobileNumberController,
              ),
              SizedBox(height: 8.h),
              AppTextFormField(
                hintText: LanguageConstants.emailAddress,
                title: LanguageConstants.emailAddress,
                titleSpacing: 2,
                prefixIcon: Icon(
                  Icons.email_outlined,
                  size: 24.w,
                  color: AppColor.primaryColor,
                ),
                onChanged: (value) {},
                controller: controller.emailController,
              ),
              SizedBox(height: 4.h),
              AppDropDownList(
                title: LanguageConstants.gender,
                items: controller.gender
                    .map(
                      (GenderModel g) => DropdownMenuItem<String>(
                        child: Row(
                          children: [
                            Icon(
                              g.icon,
                              size: 16.w,
                              color: AppColor.primaryColor,
                            ).setMarginOnly(
                              right: 16.w,
                            ),
                            Text(
                              g.gender!,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: AppColor.tagTextColor,
                                  ),
                            ),
                          ],
                        ),
                        value: g.gender,
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  controller.setDropDownValue(value);
                },
                height: 20,
                value: controller.selectedGender,
              ),
              SizedBox(height: 8.h),
              PasswordWidget(
                iconSize: 18.w,
                passwordTitleOne: 'Password',
                passwordTitleTwo: 'Confirm Password',
                passwordTwoHint: '',
                widgetSpacing: 4.h,
                passwordFieldOneController: controller.passwordOneController,
                passwordFieldTwoController: controller.passwordTwoController,
                onChangedPassOne: (value) {},
                onChangedPassTwo: (value) {},
              ),
              SizedBox(height: 4.h),
              AppButton(
                onTap: () {},
                backgroundColor: AppColor.primaryColor,
                height: 24.h,
                fontWeight: FontWeight.w700,
                label: LanguageConstants.signUp,
                textColor: AppColor.backgroundColor,
              ),
              SizedBox(height: 6.h),
              AppTextButton1(
                text1: LanguageConstants.ifYouHaveAccount,
                text2: LanguageConstants.signIn,
                onTap: () {},
              ).setMarginOnly(
                bottom: 8.h,
              ),
            ],
          ).setMarginSymmetric(
            horizontal:32.w,
            vertical: 12.h,
          ),
        );
      },
    );
  }
}
