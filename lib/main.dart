import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/config/local_storage.dart';
import 'package:untitled/config/size_config.dart';
import 'package:untitled/screens/SplashPage/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharePref.instance = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const Vault());
}

class Vault extends StatelessWidget {
  const Vault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreeen(),
    );
  }
}
