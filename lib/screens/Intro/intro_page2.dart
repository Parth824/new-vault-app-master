import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled/config/size_config.dart';
import 'package:untitled/screens/PasswordPage/security_question.dart';
import 'package:untitled/widgets/button_view.dart';
import '../PasswordPage/create_password_screen.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({super.key});

  @override
  State<IntroPage2> createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> {
  void _createFolder() async {
    final path = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_PICTURES);
    final folderPath = Directory("$path/gallerySafe");
    if (await folderPath.exists()) {
    } else {
      folderPath.create();
    }
    final image = Directory("$path/image");
    if (await image.exists()) {
    } else {
      image.create();
    }
    final folderPath2 = Directory("$path/gallerySafe/photos");
    final folderPath3 = Directory("$path/gallerySafe/videos");
    if (await folderPath2.exists()) {
    } else {
      folderPath2.create();
    }
    if (await folderPath3.exists()) {
    } else {
      folderPath3.create();
    }
    final folderPath4 = Directory("$path/gallerySafe/photos/.private");
    final folderPath5 = Directory("$path/gallerySafe/videos/.private");
    if (await folderPath4.exists()) {
    } else {
      folderPath4.create();
    }
    if (await folderPath5.exists()) {
    } else {
      folderPath5.create();
    }
    final folderPath6 = Directory("$path/gallerySafe/videos/.thumb");
    if (await folderPath6.exists()) {
    } else {
      folderPath6.create();
    }
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushAndRemoveUntil(
      CupertinoPageRoute(builder: (context) => const SecurityQuestion()),
      (route) => false,
    );
  }

  static Future<bool> externalStoragePermission(BuildContext context) async {
    final androidVersion = await DeviceInfoPlugin().androidInfo;

    if ((androidVersion.version.sdkInt) >= 30) {
      return await checkManageStoragePermission(context);
    } else {
      return await checkStoragePermission(context);
    }
  }

  static Future<bool> checkManageStoragePermission(BuildContext context) async {
    return (await Permission.manageExternalStorage.isGranted ||
        await Permission.manageExternalStorage.request().isGranted);
  }

  static Future<bool> checkStoragePermission(BuildContext context) async {
    if (await Permission.storage.isGranted ||
        await Permission.storage.request().isGranted) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            SvgPicture.asset("assets/svg/splash-1.svg"),
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            Text(
              "Storage Access",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: getProportionateScreenHeight(24),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.015,
            ),
            Text(
              "Externam Storage Permission is \nRequired for Vault",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: getProportionateScreenHeight(16),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(28)),
              child: buttonView(title: "Grant Storage Access"),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.01,
            ),
            Text(
              "Camera & Video Access",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: getProportionateScreenHeight(24),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.01,
            ),
            Text(
              "Vault app needs permission to access \nYour camera & videos",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: getProportionateScreenHeight(16),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(28)),
              child: buttonView(
                  title: "Grant Storage Access",
                  onTap: () async {
                    bool val = await externalStoragePermission(context);
                    if (await Permission.photos.isDenied) {
                      await Permission.photos.request();
                    }
                    if (await Permission.videos.isDenied) {
                      await Permission.videos.request();
                    }
                    if (val) {
                      _createFolder();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
