import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/config/app_color.dart';
import 'package:untitled/config/local_storage.dart';
import 'package:untitled/screens/HomaPage/home_page.dart';
import 'package:untitled/widgets/button_view.dart';
import 'package:untitled/widgets/toast.dart';
import '../../config/size_config.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({super.key});

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  String passwordOne = "";
  String passwordTwo = "";

  late FocusNode pin1focusNode;
  late FocusNode pin2focusNode;
  late FocusNode pin3focusNode;
  late FocusNode pin4focusNode;
  TextEditingController e1 = TextEditingController();
  TextEditingController e2 = TextEditingController();
  TextEditingController e3 = TextEditingController();
  TextEditingController e4 = TextEditingController();

  @override
  void initState() {
    super.initState();
    pin1focusNode = FocusNode();
    pin2focusNode = FocusNode();
    pin3focusNode = FocusNode();
    pin4focusNode = FocusNode();
  }

  @override
  void dispose() {
    pin1focusNode.dispose();
    pin2focusNode.dispose();
    pin3focusNode.dispose();
    pin4focusNode.dispose();
    super.dispose();
  }

  void nextField({String? val, FocusNode? focusNode, FocusNode? focusNode1}) {
    if (val!.length == 1) {
      focusNode!.requestFocus();
    } else {
      focusNode1!.requestFocus();
    }
  }

  setPassword() async {
    if (e1.text.isNotEmpty &&
        e2.text.isNotEmpty &&
        e3.text.isNotEmpty &&
        e4.text.isNotEmpty) {
      if (passwordOne.isEmpty) {
        passwordOne = "${e1.text}${e2.text}${e3.text}${e4.text}";
        e1.clear();
        e2.clear();
        e3.clear();
        e4.clear();
      } else {
        passwordTwo = "${e1.text}${e2.text}${e3.text}${e4.text}";
        if (passwordOne == passwordTwo) {
          await SharePref.instance.setBool(SharePref.isLockDone, true);
          await SharePref.instance.setString(SharePref.password, passwordOne);
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacement(
              CupertinoPageRoute(builder: (context) => HomaPage()));
        } else {
          showToast(context, "Wrong password");
        }
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            SvgPicture.asset("assets/svg/splash-2.svg"),
            SizedBox(
              height: SizeConfig.screenHeight * 0.002,
            ),
            Text(
              "Get Started",
              style: TextStyle(
                  fontFamily: "Poppins",
                  color: AppColors.primaryColor,
                  fontSize: getProportionateScreenHeight(28),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.006,
            ),
            Text(
              passwordOne.isEmpty
                  ? "Create Your Password"
                  : "ReEnter Vault PIN",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: getProportionateScreenHeight(22),
                  fontWeight: FontWeight.w500),
            ),
            Form(
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: getProportionateScreenWidth(50),
                        child: TextFormField(
                          controller: e1,
                          autofocus: true,
                          focusNode: pin1focusNode,
                          obscureText: true,
                          decoration: passwordInputDecoration,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(16)),
                          textAlign: TextAlign.center,
                          onChanged: (val) {
                            nextField(val: val, focusNode: pin2focusNode);
                          },
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth * 0.05,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(50),
                        child: TextFormField(
                          controller: e2,
                          focusNode: pin2focusNode,
                          obscureText: true,
                          decoration: passwordInputDecoration,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(16)),
                          textAlign: TextAlign.center,
                          onChanged: (val) {
                            nextField(
                                val: val,
                                focusNode: pin3focusNode,
                                focusNode1: pin1focusNode);
                          },
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth * 0.05,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(50),
                        child: TextFormField(
                          controller: e3,
                          focusNode: pin3focusNode,
                          obscureText: true,
                          decoration: passwordInputDecoration,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(16)),
                          textAlign: TextAlign.center,
                          onChanged: (val) {
                            nextField(
                                val: val,
                                focusNode: pin4focusNode,
                                focusNode1: pin2focusNode);
                          },
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth * 0.05,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(50),
                        child: TextFormField(
                          controller: e4,
                          focusNode: pin4focusNode,
                          obscureText: true,
                          decoration: passwordInputDecoration,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(16)),
                          textAlign: TextAlign.center,
                          onChanged: (val) {
                            pin4focusNode.unfocus();
                            nextField(
                                val: val,
                                focusNode: pin4focusNode,
                                focusNode1: pin3focusNode);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(50),
              ),
              child: buttonView(
                  title: "Continue",
                  onTap: () {
                    if (e1.text.isNotEmpty &&
                        e2.text.isNotEmpty &&
                        e3.text.isNotEmpty &&
                        e4.text.isNotEmpty) {
                      setPassword();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
