import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/config/app_color.dart';
import 'package:untitled/controller/image_vault_controller.dart';
import 'package:untitled/screens/LockImage/lock_image_view.dart';
import 'package:untitled/widgets/app_bar.dart';

class LockImages extends StatefulWidget {
  const LockImages({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LockImagesState createState() => _LockImagesState();
}

class _LockImagesState extends State<LockImages> {
  ImageVaultController imageVaultController = Get.put(ImageVaultController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Photos", isBackIcon: true, context: context),
      body: Obx(() => imageVaultController.imageList.isEmpty
          ? const Center(child: Text("Data not Found"))
          : GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: imageVaultController.imageList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => LockImageViewScreen(
                              path: imageVaultController.imageList[index].path,
                            )));
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColors.blackColor,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: Image.file(File(
                                    imageVaultController.imageList[index].path))
                                .image,
                            fit: BoxFit.cover)),
                  ),
                );
              })),
    );
  }
}
