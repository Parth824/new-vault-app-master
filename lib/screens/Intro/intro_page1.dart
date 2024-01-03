import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/config/app_color.dart';
import 'package:untitled/config/app_textstyle.dart';
import 'package:untitled/config/size_config.dart';
import 'package:untitled/screens/Intro/intro_page2.dart';

import 'package:untitled/widgets/button_view.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({super.key});

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  bool agree = false;

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
              flex: 3,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(10),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: agree,
                    onChanged: (value) {
                      setState(() {
                        agree = value!;
                      });
                    },
                  ),
                  Text.rich(
                    style: AppTextStyle.regularTextStyle,
                    TextSpan(children: [
                      TextSpan(
                          text: "By checking the box you agree to \nour ",
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(14),
                          )),
                      TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: getProportionateScreenHeight(14),
                          )),
                    ]),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(50),
              ),
              child: buttonView(
                title: "Continue",
                onTap: () {
                  (agree)?Get.to(() => const IntroPage2()):null;
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
