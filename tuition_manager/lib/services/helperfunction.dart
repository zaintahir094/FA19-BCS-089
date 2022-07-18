import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferenceUserRoleKey = "USERROLEKEY";
  static String sharedPreferenceUserEmailKey = "USEREMAILKEY";
  static String sharedPreferenceUserNameKey = "USERNAME";
  static String sharedPreferenceFirstStudentName = "FIRSTSTUDENTNAME";
  static String sharedPreferenceSecondStudentName = "SECONDSTUDENTNAME";
  static String sharedPreferenceFirstStudentRegistration =
      "FIRSTSTUDENTREGISTRATION";
  static String sharedPreferenceSecondStudentRegistration =
      "SECONDSTUDENTREGISTRATION";
  // static String sharedPreferenceTeacherSlot = "TEACHERSLOT";

  /// saving data to sharedpreference
  static Future<bool> saveUserLoggedInSharedPreference(
      bool isUserLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(
        sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserRoleKeySharedPreference(String userRole) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserRoleKey, userRole);
  }

  static Future<bool> saveUserEmailSharedPreference(String userEmail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserEmailKey, userEmail);
  }

  static Future<bool> saveUserNameSharedPreference(String userName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserNameKey, userName);
  }

  // static Future<bool> saveTeacherSlotSharedPreference(int slot) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return await preferences.setInt(sharedPreferenceTeacherSlot, slot);
  // }

  static Future<bool> saveFirstStudentNameSharedPreference(
      String firstStudent) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(
        sharedPreferenceFirstStudentName, firstStudent);
  }

  static Future<bool> saveSecondStudentNameSharedPreference(
      String secondStudent) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(
        sharedPreferenceSecondStudentName, secondStudent);
  }

  static Future<bool> saveFirstStudentRegistrationSharedPreference(
      String firstStdReg) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(
        sharedPreferenceFirstStudentRegistration, firstStdReg);
  }

  static Future<bool> saveSecondStudentRegistrationSharedPreference(
      String secondStdReg) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(
        sharedPreferenceSecondStudentRegistration, secondStdReg);
  }

  /// fetching data from sharedpreference
  static Future<bool?> getUserLoggedInSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(sharedPreferenceUserLoggedInKey);
  }

  static Future<String?> getUserRoleSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceUserRoleKey);
  }

  static Future<String?> getUserEmailSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceUserEmailKey);
  }

  static Future<String?> getUserNameSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceUserNameKey);
  }

  static Future<String?> getFirstStudentNameSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceFirstStudentName);
  }

  static Future<String?> getSecondStudentNameSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceSecondStudentName);
  }

  static Future<String?> getFirstStudentRegSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceFirstStudentRegistration);
  }

  static Future<String?> getSecondStudentRegSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceSecondStudentRegistration);
  }

  // static Future<int> getTeacherSlotSharedPreference() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.getInt(sharedPreferenceTeacherSlot);
  // }
}
