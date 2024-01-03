import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/config/app_color.dart';
import 'package:untitled/config/size_config.dart';
import 'package:untitled/screens/Intro/intro_page1.dart';

class SplashScreeen extends StatefulWidget {
  const SplashScreeen({super.key});

  @override
  State<SplashScreeen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Get.to(() =>  const IntroPage1());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 5,
            ),
            Container(
              height: SizeConfig.screenHeight * 0.3,
              width: SizeConfig.screenWidth * 0.65,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(
                  getProportionateScreenHeight(30),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                "App \nLogo",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: getProportionateScreenHeight(40)),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              "Welcome To \n Private Photo Vault",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: getProportionateScreenHeight(30),
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                  fontFamily: "Poppins"),
            ),
            Text(
              "Hide Personal Memories Behind Lock",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: getProportionateScreenHeight(16),
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                  fontFamily: "Poppins"),
            ),
            const Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
