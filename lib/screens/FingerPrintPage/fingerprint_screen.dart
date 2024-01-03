import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/size_config.dart';

class FingerPrintScreen extends StatefulWidget {
  const FingerPrintScreen({super.key});

  @override
  State<FingerPrintScreen> createState() => _FingerPrintScreenState();
}

class _FingerPrintScreenState extends State<FingerPrintScreen> {
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
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back),
                ),
                const Spacer(
                  flex: 2,
                ),
                Text(
                  "Fingerprint",
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
            SvgPicture.asset("assets/svg/fingerprintsplash.svg"),
            SizedBox(
              height: SizeConfig.screenHeight * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Fingerprint",
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(18),
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
                        fontSize: getProportionateScreenHeight(14),
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
    );
  }
}
