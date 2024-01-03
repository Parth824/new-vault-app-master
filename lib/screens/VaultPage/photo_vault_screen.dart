import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/config/app_color.dart';
import 'package:untitled/screens/IntruderPage/intruder_screen.dart';


import '../../config/size_config.dart';

class PhotoVaultScreen extends StatefulWidget {
  const PhotoVaultScreen({super.key});

  @override
  State<PhotoVaultScreen> createState() => _PhotoVaultScreenState();
}

class _PhotoVaultScreenState extends State<PhotoVaultScreen> {

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
                stops: [0.1, 0.6],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primaryColor,
                  AppColors.whiteColor,
                ],
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.06,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Photo Vault",
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w400,
                          fontSize: getProportionateScreenHeight(22)),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
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
                    GestureDetector(
                      onTap:(){
                        Get.to(()=>const IntruderScreen(),);
              },
                      child: Container(
                        height: SizeConfig.screenHeight * 0.064,
                        width: SizeConfig.screenWidth * 0.13,
                        padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                        decoration: BoxDecoration(
                          color: const Color(0xff4D58FF),
                          borderRadius: BorderRadius.circular(
                            getProportionateScreenHeight(10),
                          ),
                        ),
                        child: SvgPicture.asset("assets/svg/intrudersvg.svg"),
                      ),
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
                height: SizeConfig.screenHeight * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildContainer(
                    onTap: () {},
                    imagepath: "assets/svg/Images.svg",
                    text: "Photo (0)",
                  ),
                  buildContainer(
                    onTap: () {},
                    imagepath: "assets/svg/Videos.svg",
                    text: "Video (0)",
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildContainer(
                    onTap: () {},
                    imagepath: "assets/svg/Audios.svg",
                    text: "Audio (4)",
                  ),
                  buildContainer(
                    onTap: () {},
                    imagepath: "assets/svg/Files.svg",
                    text: "Files (0)",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

    );
  }



  Widget buildContainer(
      {required GestureTapCallback onTap,
      required String imagepath,
      required String text}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.screenHeight * 0.15,
        width: SizeConfig.screenWidth * 0.44,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(
            getProportionateScreenHeight(12),
          ),
          boxShadow: const [
            BoxShadow(
              offset: Offset(1, 1),
              blurRadius: 2,
              color: Colors.black12,
              spreadRadius: 1,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              imagepath,
            ),
            Text(
              text,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: getProportionateScreenHeight(16),
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
