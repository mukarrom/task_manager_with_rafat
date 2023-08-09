import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_with_rafat/data/models/login_model.dart';

class AuthUtility {
  AuthUtility._();
  static LoginModel userInfo = LoginModel();

  static Future<void> saveUserInfo(LoginModel model)async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    await _sharedPref.setString('user-data', jsonEncode(model.toJson()));
    userInfo = model;
  }
  static Future<LoginModel> getUserInfo()async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    String value = _sharedPref.getString('user-data')!;
    return LoginModel.fromJson(jsonDecode(value));
  }

  static Future<void> clearUserInfo()async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    _sharedPref.clear();
  }

  static Future<bool> checkIfUserLoggedIn()async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    bool isLogin = _sharedPref.containsKey('user-data');
    if(isLogin){
      userInfo = await getUserInfo();
    }
    return isLogin;
  }
}