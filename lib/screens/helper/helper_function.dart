import 'package:shared_preferences/shared_preferences.dart';

class helper_function {
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userUserUid = "USERUIDKEY";
  static String userOnboardingKey = "USERONBOARDINGKEY";

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveOnboardingStatus(bool isUserOnboarded) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setBool(userOnboardingKey, isUserOnboarded);
  }

  static Future<bool> saveUserName(String? userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(userNameKey, userName!);
  }

  static Future<bool> saveUserEmail(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(userEmailKey, userEmail);
  }

  static Future<bool> saveUserUid(String uid) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(userUserUid, uid);
  }

  static Future<String?> getUserUid() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userUserUid);
  }

  static Future<bool?> getUserLoggedInInstance() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }

  static Future<bool?> getUserOnboaringInstance() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userOnboardingKey);
  }

  static Future<String?> getEmail() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }

  static Future<String?> getUserName() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }
}
