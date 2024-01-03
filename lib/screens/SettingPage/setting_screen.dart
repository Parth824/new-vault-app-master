// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../config/app_color.dart';
import '../../config/size_config.dart';
import '../IconPage/icon_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                stops: [0.1, 0.5],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                
                colors: [
                  AppColors.primaryColor,
                  AppColors.whiteColor,
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.06,
                ),
                Text(
                  "Settings",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteColor,
                    fontSize: getProportionateScreenHeight(22),
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.06,
                ),
                Container(
                  height: SizeConfig.screenHeight * 0.09,
                  width: SizeConfig.screenWidth * 0.54,
                  decoration: BoxDecoration(
                    color: const Color(0xffE4E6FB),
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenHeight(10),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: SizeConfig.screenHeight * 0.064,
                        width: SizeConfig.screenWidth * 0.13,
                        padding:
                            EdgeInsets.all(getProportionateScreenHeight(5)),
                        decoration: BoxDecoration(
                          color: const Color(0xff4D58FF),
                          borderRadius: BorderRadius.circular(
                            getProportionateScreenHeight(10),
                          ),
                        ),
                        child: SvgPicture.asset("assets/svg/intrudersvg.svg"),
                      ),
                      Text(
                        "Intruder Selfie",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: getProportionateScreenHeight(17),
                            color: const Color(0xff4D58FF)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset("assets/svg/Disguis.svg"),
                    SvgPicture.asset("assets/svg/Fingerprinnt.svg"),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.07,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenHeight(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const IconScreen());
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add Vault Camera icon to Desktop",
                              style: TextStyle(
                                  fontSize: getProportionateScreenHeight(16),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins"),
                            ),
                            Text(
                              "Photo Taken By Vault Camera Will be directly save to vault",
                              style: TextStyle(
                                  fontSize: getProportionateScreenHeight(13),
                                  fontFamily: "Poppins",
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const Divider(thickness: 2),
                      Text(
                        "Change Password",
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(16),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins"),
                      ),
                      Text(
                        "Change Pin Code",
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(13),
                            fontFamily: "Poppins",
                            color: Colors.grey),
                      ),
                      const Divider(thickness: 2),
                      Row(
                        children: [
                          Text(
                            "Vibrator",
                            style: TextStyle(
                                fontSize: getProportionateScreenHeight(16),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins"),
                          ),
                          const Spacer(),
                          Switch(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                      Text(
                        "Manage vibrator when enter pin code",
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(13),
                            fontFamily: "Poppins",
                            color: Colors.grey),
                      ),
                      const Divider(thickness: 2),
                      Row(
                        children: [
                          Text(
                            "Fingerprint",
                            style: TextStyle(
                                fontSize: getProportionateScreenHeight(16),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins"),
                          ),
                          const Spacer(),
                          Switch(
                            value: true,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                      Text(
                        "Manage Fingerprint with unlock screen",
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(13),
                            fontFamily: "Poppins",
                            color: Colors.grey),
                      ),
                      const Divider(thickness: 2),
                      Text(
                        "Device Administrator",
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(16),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins"),
                      ),
                      Text(
                        "With device",
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(13),
                            fontFamily: "Poppins",
                            color: Colors.grey),
                      ),
                      const Divider(thickness: 2),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
