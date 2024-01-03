import 'package:flutter/material.dart';

import '../config/app_color.dart';
import '../config/app_textstyle.dart';

Widget buttonView(
    {BuildContext? context,
    Function()? onTap,
    @required String? title,
    double? height,
    double? width,
    Color? backgroundColor,
    double? borderRadius,
    Color? titleColor,
    Color? borderColor,
    double? titleFontSize,
    double? horizontalPadding,
    double? verticalPadding}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 16, vertical: verticalPadding ?? 8),
    child: InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 45,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          border: Border.all(color: borderColor ?? AppColors.transparentColor),
        ),
        alignment: Alignment.center,
        child: Text(
          "$title",
          style: AppTextStyle.regularTextStyle.copyWith(
              color: titleColor ?? AppColors.whiteColor,
              fontSize: titleFontSize ?? 17),
        ),
      ),
    ),
  );
}
