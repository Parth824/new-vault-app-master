import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  static late SharedPreferences instance;
  static const isFirstTime = "isFirstTime";
  static const isLockDone = "isLockDone";
  static const lockQuestion = "lockQuestion";
  static const answer = "answer";
  static const password = "password";

  // set value
  //SharePref.instance.setBool(SharePref.isFirstTime, false);

  // get value
  //SharePref.instance.getBool(SharePref.isFirstTime);

}
