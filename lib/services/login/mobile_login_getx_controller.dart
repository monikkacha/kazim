import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileLoginGetXController extends GetxController {
  late TextEditingController phoneController = TextEditingController();

  late String dialCode;

  @override
  onInit() {
    dialCode = '+91';
    super.onInit();
  }

  setDialCode(String code) {
    dialCode = code;
    update();
  }
}
