import 'package:flutter/material.dart';

import '../config/app_color.dart';
import '../config/app_textstyle.dart';
import 'button_view.dart';
import 'dialog_box.dart';

void alertDialogView({
  required BuildContext context,
  required String title,
  required String contet,
  required Function() yesPress,
  required Function() noPress,
}) {
  dialogBoxView(context,
      widget: AlertDialog(
        title: Text(
          title,
          style: AppTextStyle.regularTextStyle
              .copyWith(color: AppColors.blackColor),
        ),
        content: Text(
          contet,
          style:
              AppTextStyle.smallTextStyle.copyWith(color: AppColors.blackColor),
        ),
        actions: [
          buttonView(
              title: "Yes",
              width: 80,
              height: 35,
              onTap: yesPress,
              horizontalPadding: 0),
          buttonView(
              title: "No",
              width: 80,
              height: 35,
              onTap: noPress,
              horizontalPadding: 0),
        ],
      ));
}
