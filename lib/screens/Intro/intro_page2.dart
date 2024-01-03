import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled/config/size_config.dart';
import 'package:untitled/widgets/button_view.dart';
import '../PasswordPage/create_password_screen.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({super.key});

  @override
  State<IntroPage2> createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> {
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
                  onTap: () {
                    Get.to(() => const CreatePasswordPage());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
