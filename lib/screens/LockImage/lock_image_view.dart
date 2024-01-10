// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'dart:io';
import 'package:external_path/external_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled/config/app_color.dart';
import 'package:untitled/config/app_textstyle.dart';
import 'package:untitled/controller/image_vault_controller.dart';
import 'package:untitled/screens/VaultPage/photo_vault_screen.dart';
import 'package:untitled/widgets/alert_dialog_box.dart';
import 'package:untitled/widgets/app_bar.dart';

class LockImageViewScreen extends StatefulWidget {
  final String path;
  const LockImageViewScreen({Key? key, required this.path}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LockImageViewScreenState createState() => _LockImageViewScreenState();
}

class _LockImageViewScreenState extends State<LockImageViewScreen> {
  ImageVaultController imageVaultController = Get.put(ImageVaultController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          title: widget.path.split("/").last,
          isBackIcon: true,
          context: context),
      body: Center(
        child: Image.file(
          File(widget.path),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    alertDialogView(
                        context: context,
                        title: "Delete",
                        contet: "Are you sure to delete?",
                        yesPress: () async {
                          File file = File(widget.path);

                          await file.delete();
                          Navigator.of(context).pushAndRemoveUntil(
                              CupertinoDialogRoute(
                                  builder: (context) => const PhotoVaultScreen(),
                                  context: context),
                              (route) => false);
                        },
                        noPress: () {
                          Navigator.of(context).pop();
                        });
                  },
                  child: Column(
                    children: [
                      Obx(() => SvgPicture.asset(
                            "assets/icon/delete.svg",
                            color:AppColors.blackColor,
                          )),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Delete",
                        style: AppTextStyle.smallTextStyle,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final path =
                        await ExternalPath.getExternalStoragePublicDirectory(
                            ExternalPath.DIRECTORY_PICTURES);
                    final folderPath = Directory(path);
                    String safePath = folderPath.path;
                    File file = File(widget.path);
                    String name = file.path.split("/").last;
                    File newFile = file.copySync("$safePath/image/$name");
                    log(newFile.path);
                    file.delete();
                    Navigator.of(context).pushAndRemoveUntil(
                        CupertinoDialogRoute(
                            builder: (context) => const PhotoVaultScreen(),
                            context: context),
                        (route) => false);
                  },
                  child: Column(
                    children: [
                      Obx(
                        () => SvgPicture.asset(
                          "assets/icon/unlock.svg",
                          color: AppColors.blackColor,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "UnLock",
                        style: AppTextStyle.smallTextStyle,
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
