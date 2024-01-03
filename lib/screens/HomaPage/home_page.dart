import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/config/app_color.dart';
import 'package:untitled/screens/BrowserPage/privacy_browser_screen.dart';
import '../VaultPage/photo_vault_screen.dart';

class HomaPage extends StatefulWidget {
  const HomaPage({super.key});

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  PageController pageController = PageController();
  int index = 0;
  List body = [const PhotoVaultScreen(), const PrivacyBrowserScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[index],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      width: 375,
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDFD),
        border: Border.all(width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 9,
            offset: Offset(-4, 0),
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              index = 0;
              setState(() {});
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  // ignore: deprecated_member_use
                  "assets/svg/vault.svg",
                  color: (index == 0) ? AppColors.primaryColor : null,
                ),
                Text(
                  'Vault',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: (index == 0)
                        ? AppColors.primaryColor
                        : AppColors.blackColor,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: 0.28,
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              index = 1;
              setState(() {});
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  // ignore: deprecated_member_use
                  "assets/svg/browser.svg",
                  color: (index == 1) ? AppColors.primaryColor : null,
                ),
                Text(
                  'Browser',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: (index == 1)
                        ? AppColors.primaryColor
                        : AppColors.blackColor,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: 0.28,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// SvgPicture.asset(
//               // ignore: deprecated_member_use
//               "assets/svg/vault.svg",
//               color: (index == 0) ? AppColors.primaryColor : null,
//             )