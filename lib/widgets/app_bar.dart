import 'package:flutter/material.dart';

import '../config/app_color.dart';
import '../config/app_textstyle.dart';

PreferredSizeWidget appBar({
  required BuildContext context,
  required String title,
  List<Widget>? action,
  bool isDrawer = false,
  bool isBackIcon = false,
  Widget? drawer,
  double? elevation,
}) {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        title,
        style:
            AppTextStyle.mediumTextStyle.copyWith(color: AppColors.blackColor),
      ),
    ),
    leading: isDrawer
        ? drawer
        : isBackIcon
            ? IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.blackColor,
                ),
              )
            : null,
    backgroundColor: AppColors.whiteColor,
    elevation: elevation ?? 0,
    actions: action,
  );
}
