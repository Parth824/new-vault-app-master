import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/size_config.dart';

class IconScreen extends StatefulWidget {
  const IconScreen({super.key});

  @override
  State<IconScreen> createState() => _IconScreenState();
}

class _IconScreenState extends State<IconScreen> {
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
                  "Icons",
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
            SizedBox(
              height: SizeConfig.screenHeight * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(18)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Use app lock icon",
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(18),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins"),
                      ),
                      const Spacer(),
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Disguised as a Calender",
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(18),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins"),
                      ),
                      const Spacer(),
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Disguised as a Music",
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(18),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins"),
                      ),
                      const Spacer(),
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Disguised as a Clock",
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(18),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins"),
                      ),
                      const Spacer(),
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
