import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../config/app_color.dart';

void showToast(BuildContext context, String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor:  AppColors.blackColor,
      textColor: AppColors.whiteColor);
}
