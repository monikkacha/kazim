import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_beta/auth/google_authentication.dart';
import 'package:project_beta/constants/app_icons.dart';
import 'package:project_beta/constants/lang_constants.dart';
import 'package:project_beta/network/api_service.dart';
import 'package:project_beta/src/common_widgets/snackbars.dart';
import 'package:project_beta/src/models/gender_model.dart';
import 'package:project_beta/utils/validator.dart';

class CreateAccountGetXController extends GetxController {

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordOneController = TextEditingController();
  final TextEditingController passwordTwoController = TextEditingController();

  String _selectedCountryCode = "+91";

  final List<GenderModel> gender = [
    GenderModel(
      gender: 'Male',
      icon: AppIcons.male,
    ),
    GenderModel(
      gender: 'Female',
      icon: AppIcons.female,
    )
  ].obs;

  late String selectedGender;

  String get selectedCountryCode => _selectedCountryCode;

  set selectedCountryCode(String value) => _selectedCountryCode = value;

  @override
  onInit() async {
    selectedGender = gender.first.gender!;
    super.onInit();
  }

  setDropDownValue(value) {
    selectedGender = value;
    update();
  }

  registerAccount(BuildContext context) async {
    if (!_isValidate(context)) {
      return;
    }

    var result = await GoogleAuthentication.registerWithEmailAndPassword(
        email: emailController.value.text,
        password: passwordOneController.value.text);

    if (result[0]) {
      var data = {
        "email": emailController.value.text,
        "password": passwordOneController.value.text,
        "first_name": firstNameController.value.text,
        "last_name": lastNameController.value.text,
        "gender": selectedGender,
        "mobile_number": mobileNumberController.value.text,
        "country_code": _selectedCountryCode,
        "firebase_id": result[1],
        "role_id": "4",
      };

      var response = await ApiService.registerUser(data: data);
      if (response != null || response.data["user_id"] != null) {
        Snackbars.showTextSnackBar(
            text: LanguageConstants.registrationSuccessful, context: context);
      } else {
        Snackbars.showTextSnackBar(
            text: LanguageConstants.registrationFailed, context: context);
      }
    } else {
      Snackbars.showTextSnackBar(text: result[1], context: context);
    }
  }

  bool _isValidate(BuildContext context) {
    var email = emailController.value.text;
    var password = passwordOneController.value.text;
    var confirmPassword = passwordTwoController.value.text;
    var firstName = firstNameController.value.text;
    var lastName = lastNameController.value.text;
    var mobileNumber = mobileNumberController.value.text;
    var isEmailValid = Validation.isEmailValid(email: email);

    if (email.isEmpty) {
      Snackbars.showTextSnackBar(text: "email is required", context: context);
      return false;
    } else if (!isEmailValid) {
      Snackbars.showTextSnackBar(
          text: "Email is not validated", context: context);
      return false;
    } else if (password.isEmpty) {
      Snackbars.showTextSnackBar(
          text: "password is required", context: context);
      return false;
    } else if (confirmPassword.isEmpty) {
      Snackbars.showTextSnackBar(
          text: "confirm password is required", context: context);
      return false;
    } else if (password.trim() != confirmPassword.trim()) {
      Snackbars.showTextSnackBar(
          text: "password does not match , please check them and try again",
          context: context);
      return false;
    } else if (confirmPassword.isEmpty) {
      Snackbars.showTextSnackBar(
          text: "confirm password is required", context: context);
      return false;
    } else if (firstName.isEmpty) {
      Snackbars.showTextSnackBar(
          text: "first name is required", context: context);
      return false;
    } else if (lastName.isEmpty) {
      Snackbars.showTextSnackBar(
          text: "last name is required", context: context);
      return false;
    } else if (mobileNumber.isEmpty) {
      Snackbars.showTextSnackBar(
          text: "mobile number is required", context: context);
      return false;
    } else if (_selectedCountryCode.isEmpty) {
      Snackbars.showTextSnackBar(
          text: "please select country", context: context);
      return false;
    } else if (selectedGender.isEmpty) {
      Snackbars.showTextSnackBar(
          text: "please select gender", context: context);
      return false;
    } else if (_selectedCountryCode.isEmpty) {
      Snackbars.showTextSnackBar(
          text: "please select country", context: context);
      return false;
    }
    return true;
  }
}
