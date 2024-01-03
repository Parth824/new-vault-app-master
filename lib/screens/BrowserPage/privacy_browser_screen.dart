import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/screens/BrowserPage/search_page.dart';

import '../../config/app_color.dart';
import '../../config/size_config.dart';

class PrivacyBrowserScreen extends StatefulWidget {
  const PrivacyBrowserScreen({super.key});

  @override
  State<PrivacyBrowserScreen> createState() => _PrivacyBrowserScreenState();
}

class _PrivacyBrowserScreenState extends State<PrivacyBrowserScreen> {
  TextEditingController textEditingController = TextEditingController();
  String initialUrl = "";

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
                      "Privacy Browser",
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
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: SizeConfig.screenHeight * 0.68,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    getProportionateScreenHeight(40),
                  ),
                  topRight: Radius.circular(
                    getProportionateScreenHeight(40),
                  ),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.06,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenHeight(16)),
                    child: TextFormField(
                      onFieldSubmitted: (value) async {
                        if (value.contains(".")) {
                          initialUrl = "https://";
                          initialUrl += value;
                        } else {
                          initialUrl = "https://www.google.com/search?q=";
                          initialUrl += value;
                        }
                        Get.to(() => SearchPage(url: initialUrl));
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(13)),
                        ),
                        hintText: "Enter url or website name",
                        prefixIcon: ImageIcon(
                          const AssetImage("assets/images/search.png"),
                          color: Colors.black,
                          size: getProportionateScreenHeight(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              initialUrl = "https://www.facebook.com";
                              Get.to(() => SearchPage(url: initialUrl));
                            },
                            child: SvgPicture.asset("assets/svg/FB Button.svg"),
                          ),
                          InkWell(
                            onTap: () {
                              initialUrl = "https://www.instaram.com";
                              Get.to(() => SearchPage(url: initialUrl));
                            },
                            child:
                                SvgPicture.asset("assets/svg/Insta Button.svg"),
                          ),
                          InkWell(
                              onTap: () {
                                initialUrl = "https://www.twitter.com";
                                Get.to(() => SearchPage(url: initialUrl));
                              },
                              child: SvgPicture.asset(
                                  "assets/svg/Twitter Button.svg")),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset("assets/svg/Add Button.svg"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: _floatingAct(),
    );
  }

  // ignore: unused_element
  Widget _floatingAct() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        GestureDetector(
            onTap: () {}, child: SvgPicture.asset("assets/svg/right.svg")),
        const Spacer(),
        GestureDetector(
            onTap: () {}, child: SvgPicture.asset("assets/svg/left.svg")),
        const Spacer(),
        GestureDetector(
            onTap: () {}, child: SvgPicture.asset("assets/svg/val.svg")),
        const Spacer(),
        GestureDetector(
            onTap: () {}, child: SvgPicture.asset("assets/svg/home.svg")),
        const Spacer(),
        GestureDetector(
            onTap: () {}, child: SvgPicture.asset("assets/svg/bookmark.svg")),
        const Spacer(),
      ],
    );
  }
}
