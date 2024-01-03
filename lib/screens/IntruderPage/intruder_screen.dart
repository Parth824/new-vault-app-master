import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/config/app_color.dart';

import '../../config/size_config.dart';

class IntruderScreen extends StatefulWidget {
  const IntruderScreen({super.key});

  @override
  State<IntruderScreen> createState() => _IntruderScreenState();
}

class _IntruderScreenState extends State<IntruderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.06,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const Spacer(
                  flex: 2,
                ),
                Text(
                  "Intruder",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: getProportionateScreenHeight(22),
                    fontFamily: "Poppins",
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
            SvgPicture.asset("assets/svg/Intruder.svg"),
            SizedBox(
              height: SizeConfig.screenHeight * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(15)),
              child: Row(
                children: [
                  Text(
                    "Intruder",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: getProportionateScreenHeight(16),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Switch(
                    value: true,
                    activeColor: AppColors.primaryColor,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(15)),
              child: Text(
                "After the unlocking fails, a photo is taken to view  the intruder...",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: getProportionateScreenHeight(14),
                    color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
